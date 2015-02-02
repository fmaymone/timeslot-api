module TS_Role
  def self.included(base)
    base.enum role: { user: 0, bronze: 1, silver: 2, gold: 3, admin: 4 }
    base.after_initialize :set_default_role, if: :new_record?
  end

  private def set_default_role
    self.role ||= :user
  end
end
