class SoftDeleteService
  def self.call(model)
    model.update(deleted_at: Time.zone.now)
  end
end
