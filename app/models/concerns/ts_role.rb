module TSRole
  # http://railsapps.github.io/rails-authorization.html
  def self.included(base)
    base.enum role:
                {
                  basic: 0, # real humans
                  public_user: 1, # public users
                  crawler_source: 2, # will be removed / changed
                  global_slot_category: 3,
                  curator: 4, # adds moderated content to timeslot
                  timeslot_calendar: 5, # for calendars created by curators
                  webview: 6, # for content sharing
                }
    base.after_initialize :set_default_role, if: :new_record?
  end

  private def set_default_role
    self.role ||= :basic
  end
end
