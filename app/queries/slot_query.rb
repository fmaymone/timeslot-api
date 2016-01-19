module SlotQuery
  class OwnSlots
    include TSErrors
    attr_reader :relation

    def initialize(relation: BaseSlot.all, direction: nil)
      @direction = direction
      @relation = relation.joins(:meta_slot).extending(Scopes)
      # @relation = relation
      #             .includes(meta_slot: [:creator, :ios_location])
      #             .references(:meta_slot)
      #             .extending(Scopes)
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
        when 'finished'
          @relation.where(finished moment).ordered_rev
        when 'upcoming', 'ongoing', 'past', 'now'
          # here we send the 'filter' as a message to this SlotQuery:OwnSlots
          # class, which means, we are calling the method with the name of
          # the 'filter'
          @relation.where(send filter, moment).ordered
        else
          # TODO: make a helper for enriched airbrake error messages
          error_string = "unkown pagination filter #{filter}"
          msg = { message: error_string }
          Rails.logger.error { error_string }
          Airbrake.notify(PaginationError, msg)
          fail PaginationError, msg if Rails.env.test? || Rails.env.development?
          # TODO: check if we should call 'new' for custom error classes? Why?
          # fail PaginationError.new(msg) if Rails.env.test? || Rails.env.development?
        end
      end
    end

    private def upcoming(moment = Time.zone.now)
      meta_table[:start_date].gteq(moment)
    end

    private def later(moment = Time.zone.now)
      meta_table[:start_date].gt(moment)
    end

    private def past(moment = Time.zone.now)
      meta_table[:start_date].lt(moment)
    end

    private def finished(moment = Time.zone.now)
      meta_table[:end_date].lteq(moment)
    end

    private def ongoing(moment = Time.zone.now)
      meta_table[:start_date].lteq(moment).and(
        meta_table[:end_date].gteq(moment))
    end

    private def now(moment = nil)
      upcoming(moment).or ongoing(moment)
    end

    private def after_cursor(cursor)
      same_startend(cursor).or same_start(cursor).or later(cursor[:startdate])
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
        past(cursor[:startdate]))
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
