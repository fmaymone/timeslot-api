json.extract! @user,
:id,
:username,
:email,
:default_alerts,
:created_at,
:updated_at,
:deleted_at
json.image @user.image ? @user.image.public_id : nil
