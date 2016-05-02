class SlotPaginator < BasePaginator
  # prepares the values needed by the view

  attr_accessor :mode, :moment, :after, :before, :filter, :earliest, :latest

  # TODO: this is a complete mess, needs refactoring
  def initialize(data:, limit:, mode: nil, moment: nil,
                 filter: nil, earliest: nil, latest: nil,
                 after: nil, before: nil)
    super(limit: limit.to_i)
    @mode = mode # upcoming, ongoing, past, finished, now, around
    @moment = moment # a timestamp (point-in-time)
    @filter = filter
    @earliest = earliest # a timestamp (point-in-time)
    @latest = latest # a timestamp (point-in-time)
    @result_collection_size = data.data.size
    @data = data.data
    @datapool_size = data.pool_size

    # db has enough items to fulfill request
    if @limit == @result_collection_size
      # query was based on cursor
      if @filter == 'between' && (before.nil? && after.nil?)
        # backward looking search without cursor
        if (mode == 'past') || (mode == 'finished')
          @after = nil
          @before = @data.first.as_paging_cursor
        # forward looking search without cursor
        else
          @after = @data.last.as_paging_cursor
          @before = nil
        end
      else
        @after = @data.last.as_paging_cursor
        @before = @data.first.as_paging_cursor
      end
    elsif @data.empty? && (@datapool_size > 0)
      # request is not fulfilled but db has valid items which could
      # be paginated via cursor
      if before || (mode == 'past') || (mode == 'finished') # backward
        @after = moment_as_cursor(@moment)
        @before = nil
      else # forward
        @after = nil
        @before = moment_as_cursor(@moment)
      end
    elsif @result_collection_size == @datapool_size
      # all valid data is returned
    # elsif @datapool.empty? # db has no results
      @after = nil
      @before = nil
    # else # elsif @limit > @result_collection_size
    # we don't have enough items in the db to completely fulfill the query
    elsif @filter == 'between'
      if before
        @after = @data.last.as_paging_cursor
        @before = nil
      elsif after
        @after = nil
        @before = @data.first.as_paging_cursor
      else # no cursor was used, inital request
        @after = nil
        @before = nil
      end
    elsif @mode == 'around'
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
    elsif before || (mode == 'past') || (mode == 'finished')
      # result set is based on backward pagination
      @after = @data.last.as_paging_cursor
      @before = nil
    else
      # result set is based on forward pagination
      @after = nil
      @before = @data.first.as_paging_cursor
    end
  end

  private def moment_as_cursor(moment)
    Base64.urlsafe_encode64("0%#{moment}%#{moment}")
  end
end
