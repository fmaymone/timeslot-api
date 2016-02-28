json.id slotgroup.uuid
json.extract!(slotgroup,
              :name,
              :image,
              :created_at,
              :updated_at,
              :deleted_at
             )
json.owner do
  json.id slotgroup.owner_id
end
