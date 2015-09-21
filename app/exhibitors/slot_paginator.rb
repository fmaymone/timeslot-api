class SlotPaginator < BasePaginator
  attr_accessor :status, :moment, :cursor, :user

  # def initialize(data:, paging_params:)
  def initialize(limit: 40, status: 'now', moment: Time.zone.now, data:)
    super(limit: limit)
    self.status = status # upcoming, ongoing, past, now, around
    self.moment = moment # a timestamp (point-in-time)
    self.data = data
  end

  def call
    # self.data = @user.my_slots(status: status, moment: moment)
    slot_query = SlotQuery::OwnSlots.new(relation: user.std_slots.unscoped)
    reslot_query = SlotQuery::OwnSlots.new(relation: user.re_slots.unscoped)
    # slot_query.search.test(self.status, moment, limit, id)
    # self.data = slot_query.retrieve.test(status, moment, limit, user.id)
    # self.data = slot_query.paginate limit: 2

    # my_query = slot_query.retrieve(
      # status: status, moment: moment).union(:all, reslot_query.retrieve(
                                              # status: status, moment: moment))

    pp "calling #{status}"
    self.data = slot_query.retrieve(status: status, moment: moment)
    # my_query = slot_query.retrieve(status: status, moment: moment)
    # .union(reslot_query.retrieve(status: status, moment: moment))

    # slots_table = StdSlot.unscoped.arel_table
    # table_alias = slots_table.create_table_alias(my_query, :std_slots)
    # res = StdSlot.unscoped.from(table_alias)
    # pp res

      # pp self.data
    # slot_query.retrieve.try(status.to_sym, moment, 50, user.id)
    # return query object

    self.data += reslot_query.retrieve(status: status, moment: moment)

    # self.data = res
    self
  end
end
