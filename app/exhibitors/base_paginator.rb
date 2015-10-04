class BasePaginator
  class InterfaceNotImplementedError < NoMethodError; end

  attr_accessor :limit, :data

  def initialize(limit: 20)
    @limit = limit
  end

  def call
    fail InterfaceNotImplementedError
  end
end
