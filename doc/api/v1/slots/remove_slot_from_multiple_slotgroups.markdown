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
Authorization: Token token=A-u5wm6wXS8yDwzjrRCX-Xn-qzg
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/19/slotgroups</pre>

#### Body
```javascript
{
  "slotGroups" : [
    "fe1d7cd4-9295-4edf-980a-06e312ff7f2d",
    "4f09fe96-2061-4318-bb87-a4752b4a7c26",
    "69ce14d3-5e9e-4b70-a3ca-1acab0d49e9a",
    "f2305481-7125-4893-90b3-45b310fec048"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/19/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;fe1d7cd4-9295-4edf-980a-06e312ff7f2d&quot;,&quot;4f09fe96-2061-4318-bb87-a4752b4a7c26&quot;,&quot;69ce14d3-5e9e-4b70-a3ca-1acab0d49e9a&quot;,&quot;f2305481-7125-4893-90b3-45b310fec048&quot;]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=A-u5wm6wXS8yDwzjrRCX-Xn-qzg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a90c74904ed87b3ca6a3a686992a1a40&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b667e355-427a-4434-9c86-ed1e9ceac41f
X-Runtime: 0.113489
Vary: Origin
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "unauthorizedSlotgroups" : [
    "69ce14d3-5e9e-4b70-a3ca-1acab0d49e9a",
    "f2305481-7125-4893-90b3-45b310fec048"
  ]
}
```
