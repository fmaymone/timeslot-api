module SlotQuery
  class OwnSlots
    attr_reader :relation

    def initialize(relation: BaseSlot.all)
      # @relation = relation.joins(:meta_slot).extending(Scopes)
      @relation = relation.includes(:meta_slot).references(:meta_slots).extending(Scopes)
    end

    def retrieve(status: nil, moment: Time.zone.now, cursor: nil)
      return @relation if status == 'all' || status.nil?
      return @relation.where(after_cursor(cursor)) if cursor
      @relation.where(send status, moment)
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

    private def after_cursor(cursor)
      same_startend(cursor).or same_start(cursor).or upcoming(cursor.start_date)
    end

    private def same_startend(cursor)
      meta_table[:start_date].eq(cursor.start_date).and(
        meta_table[:end_date].eq(cursor.end_date)).and(
        @relation.arel_table[:id].gt(cursor.id))
    end

    private def same_start(cursor)
      meta_table[:start_date].eq(cursor.start_date).and(
        meta_table[:end_date].gt(cursor.end_date))
    end

    def meta_table
      MetaSlot.arel_table
    end

    module Scopes
      def paginate(limit = 20)
        limit(limit)
      end

      def ordered
        order(MetaSlot.arel_table[:start_date],
              MetaSlot.arel_table[:end_date],
              :id)
      end
    end
  end
end
