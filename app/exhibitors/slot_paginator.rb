class SlotPaginator < BasePaginator
  attr_accessor :status, :moment, :cursor, :user

  # def initialize(data:, paging_params:)
  def initialize(limit: 40, status: 'now', moment: Time.zone.now, data:)
    super(limit: limit)
    self.status = status # upcoming, ongoing, past, now, around
    self.moment = moment # a timestamp (point-in-time)
    self.data = data
  end
end
