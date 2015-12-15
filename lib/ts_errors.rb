module TSErrors
  # Raised when the pagination cursor is not valid anymore (usually because
  # slot.start_date or slot.end_date has changed since encoding).
  class PaginationError < StandardError
    def initialize(msg = nil)
      super(msg)
    end
  end

  # Raised when the a service from the DATA_TEAM doesn't return
  # a useful result.
  class DataTeamServiceError < StandardError
    def initialize(service, e)
      data_team_msg = e.io.meta_setup_encoding
      super("#{service}: #{data_team_msg} - [#{e.class}] #{e.message}")
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
