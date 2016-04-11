module TSRole
  # http://railsapps.github.io/rails-authorization.html
  def self.included(base)
    base.enum role:
                {
                  basic: 0,
                  webview: 1,
                  crawler_source: 2,
                  global_slot_category: 3
                }
    base.after_initialize :set_default_role, if: :new_record?
  end

  private def set_default_role
    self.role ||= :basic
  end
end
