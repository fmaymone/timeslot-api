module TSErrors
  # Raised when the pagination cursor is not valid anymore (usually because
  # slot.start_date or slot.end_date has changed since encoding).
  class PaginationError < StandardError
    def initialize(msg = nil)
      super(msg)
    end
  end

  # Raised when the value of a parameter is invalid.
  class ParameterInvalid < StandardError
    def initialize(param, value)
      super("#{value} is not a valid value for param: #{param}")
    end
  end

  class MissingCurrentUserError < Pundit::NotAuthorizedError; end
end
