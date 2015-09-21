module SlotQuery
  class OwnSlots
    attr_reader :relation

    def initialize(relation: BaseSlot.all)
      # def initialize(relation: BaseSlot.all, limit: 20, status: 'now',
      #                  moment: Time.zone.now, user:)
      # @relation = relation.joins(:meta_slot).extending(Scopes)
      @relation = relation.includes(:meta_slot).references(:meta_slots).extending(Scopes)

      # User.includes(:posts).where('posts.name = ?', 'example').references(:posts)

      # @relation = relation.select(:id, :meta_slot_id, :created_at, :updated_at, :deleted_at, :slot_type, :share_id).joins(:meta_slot).extending(Scopes)

      # self.status = status
      # self.moment = moment
      # self.limit = limit
      # self.user = user
    end

    def find_each(&block)
      relation.where(privileged_users).find_each(&block)
    end

    def retrieve(status: nil, moment: Time.zone.now)
      return @relation unless status
      return @relation if status == 'all'
      @relation.where(send status, moment: moment)#.union(:all, ReSlot.unscoped.all.where(send status, moment: moment))
    end

    def find_each_upcoming(&block)
      relation.where(upcoming).find_each(&block)
    end

    private def now(moment: nil)
      # search.upcoming().union.ongoing()
      upcoming(moment: moment).or ongoing(moment: moment)
    end

    private def upcoming(moment: Time.zone.now)
      meta_table[:start_date].gt(moment)
    end

    private def ongoing(moment: Time.zone.now)
      pp 'fine'
      pp moment
      meta_table[:start_date].lteq(moment).and(
        meta_table[:end_date].gteq(moment))
    end

    private def past(moment: Time.zone.now)
      meta_table[:end_date].lteq(moment)
    end

    def meta_table
      MetaSlot.arel_table
    end

    module Scopes
      def paginate(limit = 20)
        limit(limit)
      end

      def test(status, moment, limit, id)
        # Model.skip(10).take(limit)

        past = "owner_id = ? AND meta_slots.end_date < ?"
        upcoming = "owner_id = ? AND meta_slots.start_date >= ?"
        ongoing = "owner_id = ? AND meta_slots.start_date < ? AND meta_slots.end_date >= ?"

        case status
        when 'upcoming'
          joins(:meta_slot).where(upcoming, id, moment).limit(limit)
        when 'past'
          joins(:meta_slot).where(past, id, moment).limit(limit)
        when 'ongoing'
          joins(:meta_slot).where(ongoing, id,  moment, moment).order('meta_slots.start_date').limit(limit)
        when 'now'
          pp joins(:meta_slot).where("#{ongoing} OR #{upcoming}", id, moment, moment, id, moment).order('meta_slots.start_date').limit(limit)#.explain

        # when 'around'
        #   joins(:meta_slot).where("#{ongoing} OR #{upcoming}", id, moment, moment, id, moment).limit(limit)
        else # all
          joins(:meta_slot).where(owner: self).order('meta_slots.start_date').limit(limit)
        end
      end

      def ongoing(moment, limit, id)
        ongoing = "owner_id = ? AND meta_slots.start_date < ? AND meta_slots.end_date >= ?"
        joins(:meta_slot).where(ongoing, id, moment, moment).order('meta_slots.start_date').limit(limit)
      end

      def upcomings(moment, limit, id)
        upcoming = "owner_id = ? AND meta_slots.start_date >= ?"
        joins(:meta_slot).where(upcoming, id, moment).limit(limit)
      end

      def now(moment, limit, id)

        upcoming = "owner_id = ? AND meta_slots.start_date >= ?"
        ongoing = "owner_id = ? AND meta_slots.start_date < ? AND meta_slots.end_date >= ?"
        slots_table = StdSlot.arel_table
        # table_alias = slots_table.create_table_alias(now, :std_slots)
        # slots_now = StdSlot.unscoped.from(table_alias)
        joins(:meta_slot).where("#{ongoing} OR #{upcoming}", id, moment, moment, id, moment).order('meta_slots.start_date').limit(limit)#.explain

        # ongoing(moment, limit, id).union(upcoming(moment, limit, id))
      end

      def with_skill(skill)
        joins(:pokemon_skills).where("pokemon_skills.name = ?", skill)
      end

      def is_available(date)
        joins(:schedules).where('schedules.day_of_week = ?', time(date).wday)
      end

      def with_weakness(weakness)
        joins(pokemon_weakness).where("pokemon_weakness.name = ?", weakness)
      end
    end
  end
end
