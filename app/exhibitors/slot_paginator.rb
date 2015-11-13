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
        if upcomings == (@limit / 2)
          # we have enough future slots
          @after = @data.last.as_paging_cursor
        else
          @after = nil
        end
        if pasts == (@limit / 2)
          # we have enough past slots
          @before = @data.first.as_paging_cursor
        else
          @before = nil
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
