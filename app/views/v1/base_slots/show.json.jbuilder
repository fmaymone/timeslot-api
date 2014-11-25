json.extract!(@slot,
              :id,
              :title,
              :startdate,
              :enddate,
              # :creator_id,
              # :alerts,
              :note,
              :created_at,
              :updated_at,
              :deleted_at
             )
if @slot.class == StdSlot
  json.visibility @slot.visibility
elsif @slot.class == GroupSlot
  json.group_id @slot.group.id
end
# json.media @slot.media_items, :id, :media_type, :public_id, :ordering
