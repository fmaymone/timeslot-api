# Slots API

## Add Slot to multiple SlotGroups

### POST /v1/slots/:id/slotgroups

Send an array of slotGroup UUIDs and the slot will be added to those slotGroups.

returns a list of all slotgroups where user has no access rights

returns 404 if ID is invalid

returns ???

### Parameters

Name : id *- required -*
Description : ID of the Slot to be added to SlotGroups

Name : slotGroups *- required -*
Description : Array with UUIDs of the SlotGroups the slot should be added to


### Response Fields

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=FoWvsIVIl15dybjAtxIdlbrzSao
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/24/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "1d80d46e-795f-47f8-b528-95486daa3a22",
    "fa9934c1-d4e1-4188-a7ec-6a1acc742b9d",
    "810f10b8-848c-4f62-abcf-c7c23896d261",
    "0ec08130-7164-400a-88b7-8cd13b554d41"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/24/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;1d80d46e-795f-47f8-b528-95486daa3a22&quot;,&quot;fa9934c1-d4e1-4188-a7ec-6a1acc742b9d&quot;,&quot;810f10b8-848c-4f62-abcf-c7c23896d261&quot;,&quot;0ec08130-7164-400a-88b7-8cd13b554d41&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=FoWvsIVIl15dybjAtxIdlbrzSao&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f72ec486d038b46fe7e5ce0082333ebe&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d3c86f32-7df1-4094-9c6c-fa68163b4db8
X-Runtime: 0.114833
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "810f10b8-848c-4f62-abcf-c7c23896d261",
    "0ec08130-7164-400a-88b7-8cd13b554d41"
  ]
}
```
