# Slots API

## Remove Slot from multiple SlotGroups

### DELETE /v1/slots/:id/slotgroups

Send an array of slotGroup UUIDs and the slot will be added to those slotGroups.

returns 404 if ID is invalid

returns ???

### Parameters

Name : id *- required -*
Description : ID of the Slot to be removed from SlotGroups

Name : slotGroups *- required -*
Description : Array with UUIDs of the SlotGroups slot should be removed from


### Response Fields

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=xe84TGk65zlvD4_9BM_YvuoOVVE
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/24/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "7994d7f7-82d7-4a0f-9748-df485910043f",
    "751147e9-b922-43fb-a644-2683158d04d2",
    "441d698e-92f3-41e5-9547-0ca52b33affa",
    "51624219-ad2f-42d9-9c1f-f04179b38de0",
    "87198950-343d-4fed-a460-839de1e594e0"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/24/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;7994d7f7-82d7-4a0f-9748-df485910043f&quot;,&quot;751147e9-b922-43fb-a644-2683158d04d2&quot;,&quot;441d698e-92f3-41e5-9547-0ca52b33affa&quot;,&quot;51624219-ad2f-42d9-9c1f-f04179b38de0&quot;,&quot;87198950-343d-4fed-a460-839de1e594e0&quot;]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=xe84TGk65zlvD4_9BM_YvuoOVVE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ee040e9556da4588dd14089c1004204f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5fe31f18-dd39-4a67-b223-106fc8ba3280
X-Runtime: 0.038841
Vary: Origin
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "51624219-ad2f-42d9-9c1f-f04179b38de0",
    "87198950-343d-4fed-a460-839de1e594e0"
  ]
}
```
