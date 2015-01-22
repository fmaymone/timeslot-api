module PreventDeletion
  class NotActivated < StandardError; end

  def ts_soft_delete
    update(deleted_at: Time.zone.now)
  end

  def destroy
    prevent_remove
  end

  def delete
    prevent_remove
  end

  private def prevent_remove
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
