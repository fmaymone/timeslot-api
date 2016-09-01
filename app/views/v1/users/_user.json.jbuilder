json.extract!(user,
              :id,
              :username,
              :first_name,
              :middle_name,
              :last_name,
              :created_at,
              :updated_at,
              :deleted_at)

json.image user.picture
