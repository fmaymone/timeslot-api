module PreventDeletion
  class NotActivated < StandardError; end

  def destroy
    if self.class == MediaItem
      Rails.logger.info "removing media_item from db: #{self}"
      super
    else
      prevent_remove
    end
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
