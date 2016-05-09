module GroupActivity
  include Activity

  private def activity_type
    'Group'
  end

  private def activity_foreign
    activity_target.try(:owner)
  end

  private def activity_groups
    [activity_target]
  end

  private def activity_visibility
    activity_target.try(:public) ? 'public' : 'private'
  end
end
