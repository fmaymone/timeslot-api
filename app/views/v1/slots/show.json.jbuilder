json.extract! @slot,
:id,
:title,
:startdate,
:enddate,
:note,
:visibility,
:alerts
json.media @slot.media_items, :id, :media_type, :public_id, :ordering
