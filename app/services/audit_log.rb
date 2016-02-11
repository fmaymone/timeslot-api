class AuditLog
  def self.after_commit(model)
    msg = model.previous_changes
    msg[:id] = model.id
    Rails.logger.info { msg.to_json }
  end
end
