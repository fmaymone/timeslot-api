class SetAlerts
  def self.call(slot, user, alert = nil)
    SlotSetting.create(user: user, meta_slot: slot.meta_slot, alerts: alert)
  end
end
