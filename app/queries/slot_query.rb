module SlotQuery
  class OwnSlots
    attr_reader :relation

    def initialize(relation: BaseSlot.all, direction: nil)
      @direction = direction
      # @relation = relation.joins(:meta_slot).extending(Scopes)
      @relation = relation.includes(:meta_slot).references(:meta_slots).extending(Scopes)
    end

    # I don't like the split in direction and cursor because they belong together
    def retrieve(filter: nil, moment: Time.zone.now, cursor: nil)
      # query with cursor
      case @direction
      when 'before'
        @relation.where(before_cursor(cursor)).ordered_rev
      when 'after'
        @relation.where(after_cursor(cursor)).ordered
      else
        # query without cursor
        case filter
        when nil
        when 'all'
          @relation
        when 'past'
          @relation.where(past moment).ordered_rev
        # when 'upcoming'
        # when 'ongoing'
        # when 'now'
        else
          # here we send the 'filter' as a message to this SlotQuery:OwnSlots
          # class, which means, we are calling the method with the name of
          # the 'filter'
          @relation.where(send filter, moment).ordered
        end
      end
    end

    private def now(moment = nil)
      upcoming(moment).or ongoing(moment)
    end

    private def upcoming(moment = Time.zone.now)
      meta_table[:start_date].gt(moment)
    end

    private def ongoing(moment = Time.zone.now)
      meta_table[:start_date].lteq(moment).and(
        meta_table[:end_date].gteq(moment))
    end

    private def past(moment = Time.zone.now)
      meta_table[:end_date].lteq(moment)
    end

    private def earlier(moment = Time.zone.now)
      meta_table[:start_date].lt(moment)
    end

    private def after_cursor(cursor)
      same_startend(cursor).or same_start(cursor).or upcoming(cursor[:startdate])
    end

    private def same_startend(cursor)
      meta_table[:start_date].eq(cursor[:startdate]).and(
        meta_table[:end_date].eq(cursor[:enddate])).and(
        @relation.arel_table[:id].gt(cursor[:id]))
    end

    private def same_start(cursor)
      meta_table[:start_date].eq(cursor[:startdate]).and(
        meta_table[:end_date].gt(cursor[:enddate]))
    end

    private def before_cursor(cursor)
      same_startend_rev(cursor).or(
        same_start_rev(cursor).or(
        earlier(cursor[:startdate]))
      )
    end

    private def same_startend_rev(cursor)
      meta_table[:start_date].eq(cursor[:startdate]).and(
        meta_table[:end_date].eq(cursor[:enddate])).and(
        @relation.arel_table[:id].lt(cursor[:id]))
    end

    private def same_start_rev(cursor)
      meta_table[:start_date].eq(cursor[:startdate]).and(
        meta_table[:end_date].lt(cursor[:enddate]))
    end

    def meta_table
      MetaSlot.arel_table
    end

    module Scopes
      def ordered
        order(MetaSlot.arel_table[:start_date],
              MetaSlot.arel_table[:end_date],
              :id)
      end

      def ordered_rev
        order(MetaSlot.arel_table[:start_date].desc,
              MetaSlot.arel_table[:end_date].desc,
              id: :desc)
      end
    end
  end
end
