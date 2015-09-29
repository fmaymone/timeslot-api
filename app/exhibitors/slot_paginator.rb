class SlotPaginator < BasePaginator
  attr_accessor :status, :moment, :cursor, :user, :after

  # def initialize(data:, paging_params:)
  def initialize(limit: 40, status: 'now', moment: Time.zone.now, after: nil,
                 data:)
    super(limit: limit.to_i)
    @status = status # upcoming, ongoing, past, now, around
    @moment = moment # a timestamp (point-in-time)

    # are there additional items to paginate over?
    if @limit < data.size
      @data = data[0...-1]
      @after = @data.last.as_paging_cursor
    else
      @data = data
      @after = nil
    end
  end
end
