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
Authorization: Token token=0BHi7nHxl708haDtdfk4kbk64eg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/22/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "6748cccb-d85b-4d72-9e61-b53632eedde4",
    "a5b0feee-558d-4dad-807f-ccad1f0d5662",
    "74eec819-9597-4547-9618-af947bf4469a",
    "193f19c6-8ff5-4972-9714-2933863d622a"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/22/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;6748cccb-d85b-4d72-9e61-b53632eedde4&quot;,&quot;a5b0feee-558d-4dad-807f-ccad1f0d5662&quot;,&quot;74eec819-9597-4547-9618-af947bf4469a&quot;,&quot;193f19c6-8ff5-4972-9714-2933863d622a&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=0BHi7nHxl708haDtdfk4kbk64eg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;68953a5820b9795cbb15de32b879631c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a7161893-4f2d-477d-aeeb-cb721bd5edf9
X-Runtime: 0.045121
Vary: Origin
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "74eec819-9597-4547-9618-af947bf4469a",
    "193f19c6-8ff5-4972-9714-2933863d622a"
  ]
}
```
