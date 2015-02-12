module TS_Role
  def self.included(base)
    base.enum role: { user: 0, webview: 1 }
    base.after_initialize :set_default_role, if: :new_record?
  end

  private def set_default_role
    self.role ||= :user
  end
end
