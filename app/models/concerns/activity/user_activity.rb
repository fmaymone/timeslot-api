module UserActivity
  include Activity

  private def activity_type
    'User'
  end

  private def activity_foreign
    nil
  end

  private def activity_visibility
    'public' # currently not supported
  end
end
