class SlotPaginator < BasePaginator
  attr_accessor :filter, :moment, :after, :before

  def initialize(data:, limit:, filter: nil, moment: nil, after: nil, before: nil)
    super(limit: limit.to_i)
    @filter = filter # upcoming, ongoing, past, finished, now, around
    @moment = moment # a timestamp (point-in-time)
    @result_collection_size = data.size
    @data = data

    if @limit == @result_collection_size
      # db has enough items to fulfill request
      @after = @data.last.as_paging_cursor
      @before = @data.first.as_paging_cursor
    elsif @data.empty?
      # db has no results
      @after = nil
      @before = nil
    else # elsif @limit > @result_collection_size
      # we don't have enough items in the db to completely fulfill the query
      if filter == 'around'
        upcomings = @data.count { |slot| slot.start_date >= moment }
        pasts = @data.count { |slot| slot.start_date < moment }
        @after = if upcomings == (@limit / 2)
                   # we have enough future slots
                   @data.last.as_paging_cursor
                 end
        @before = if pasts == (@limit / 2)
                    # we have enough past slots
                    @data.first.as_paging_cursor
                  end
      elsif before || (filter == 'past') || (filter == 'finished')
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
