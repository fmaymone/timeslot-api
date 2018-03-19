# Slots API

## Remove Slot from multiple SlotGroups

### DELETE /v1/slots/:id/slotgroups

Send an array of slotGroup UUIDs and the slot will be removed from those slotGroups.

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
Authorization: Token token=VFAkrZ1vGIHqPToL2Pjh8NoKB44
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/26/slotgroups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/26/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;374b7f5e-ac6c-4763-8c85-f815cda838b7&quot;,&quot;cb482b0f-d6d2-4bb5-9c2d-1e5acd4954bc&quot;,&quot;22ef171b-b508-4d0f-9a90-d6ce198cb9d2&quot;,&quot;3acdb796-4e17-4d48-8903-f73770af1ce9&quot;,&quot;7111a73c-ca67-47d0-9077-74b810ac5e47&quot;]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=VFAkrZ1vGIHqPToL2Pjh8NoKB44&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;a6ed9da5c28f0ba641bf5b03b37868ca&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cdef9ee2-560e-4332-80b9-d06a27dc5689
X-Runtime: 0.208054
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
