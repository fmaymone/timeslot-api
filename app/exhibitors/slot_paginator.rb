class SlotPaginator < BasePaginator
  attr_accessor :status, :moment, :cursor, :user, :after, :before

  # def initialize(data:, paging_params:)
  def initialize(limit: 40, status: 'now', moment: Time.zone.now,
                 after: nil, before: nil, data:)
    super(limit: limit.to_i)
    @status = status # upcoming, ongoing, past, now, around
    @moment = moment # a timestamp (point-in-time)
    @result_collection_size = data.size
    @data = data

    if @limit == @result_collection_size
      # db has enough items to fullfil request
      @after = @data.last.as_paging_cursor
      @before = @data.first.as_paging_cursor
    elsif @data.empty?
      # db has no results
      @after = nil
      @before = nil
    else # elsif @limit > @result_collection_size
      # we don't have enough items in the db to completely fulfill the query
      if before || status == 'past'
        # result set is based on backward pagination
        @after = @data.last.as_paging_cursor
        @before = nil
      else
        # result set is based on forward pagination
        @after = nil
        @before = @data.first.as_paging_cursor
      end
    end
  end
end
