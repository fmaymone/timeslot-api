module PreventDeletion
  class NotActivated < StandardError; end

  def destroy
    log_prevention
  end

  def delete
    log_prevention
  end

  def log_prevention
    msg = { self: self }
    msg.merge!(caller_0: caller[0])
    msg.merge!(caller_1: caller[1])
    msg.merge!(caller_2: caller[2])
    Rails.logger.error msg
    fail NotActivated, msg
  end
end

module ActiveRecord
  class Base
    include PreventDeletion
  end
end
