json.extract! @slot,
:id,
:title,
:startdate,
:enddate,
:note,
:visibility,
:created_at,
:updated_at,
:deleted_at
json.media @slot.media_items, :id, :media_type, :public_id, :ordering
