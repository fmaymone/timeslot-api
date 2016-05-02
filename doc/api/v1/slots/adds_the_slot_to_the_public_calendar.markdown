# Slots API

## adds the slot to the public calendar

### POST /v1/slots/:id/slotgroups

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
Authorization: Token token=lGW9BYmCT7Z7jfUGvjn7VYRxZ80
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/52/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "0ef38a65-93e1-46a5-8fe5-83ee681da9fe",
    "f405cc87-4d4c-41e7-b79f-e94b3fabf7d3"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/52/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;0ef38a65-93e1-46a5-8fe5-83ee681da9fe&quot;,&quot;f405cc87-4d4c-41e7-b79f-e94b3fabf7d3&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=lGW9BYmCT7Z7jfUGvjn7VYRxZ80&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d22f446506f59f4196cd3309c5120ff5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b479b617-1316-4de1-92c5-da3fa39a8743
X-Runtime: 0.049393
Content-Length: 29</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : []
}
```
