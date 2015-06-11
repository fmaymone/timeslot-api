json.extract!(user,
              :id,
              :username,
              :created_at,
              :updated_at,
              :deleted_at)

json.image do
  json.clyid user.image.try(:public_id) ? user.image.public_id : nil
  json.local_id user.image.try(:local_id) ? user.image.local_id : nil
end
