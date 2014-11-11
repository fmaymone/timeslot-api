class AuditService
  def self.after_commit(model)
    msg = model.previous_changes
    msg.merge!(id: model.id)
    Rails.logger.info msg.to_json
  end
end
