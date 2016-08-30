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
Authorization: Token token=nRZXk-0PBVkeSGLSGIoUdOKKpFs
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/27/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "cf7fc586-cf15-4455-9d64-f12dde27be2d",
    "3fe75016-b877-4a84-be4c-948d65b53270",
    "1694012a-b3a2-4d6d-94b7-60bc8d65231e",
    "980184bc-1e34-4693-881c-33bc4e164de5",
    "9e9a0711-7d24-4fea-b65b-f2cb14ab6cf8"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/27/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;cf7fc586-cf15-4455-9d64-f12dde27be2d&quot;,&quot;3fe75016-b877-4a84-be4c-948d65b53270&quot;,&quot;1694012a-b3a2-4d6d-94b7-60bc8d65231e&quot;,&quot;980184bc-1e34-4693-881c-33bc4e164de5&quot;,&quot;9e9a0711-7d24-4fea-b65b-f2cb14ab6cf8&quot;]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=nRZXk-0PBVkeSGLSGIoUdOKKpFs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5775df701bae49a4ab19cb721ba6b6dd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a3919a40-0c26-4158-8a90-9e83752295e2
X-Runtime: 0.089422
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "980184bc-1e34-4693-881c-33bc4e164de5",
    "9e9a0711-7d24-4fea-b65b-f2cb14ab6cf8"
  ]
}
```
