# Slots API

## Update MetaSlot

### PATCH /v1/metaslot/:id

Update content of MetaSlot.

User must be creator of MetaSlot.

returns 204 if update succeded 

returns 404 if User not creator or ID is invalid

returns 422 if parameters are invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : title
Description : Updated title of slot

Name : startDate
Description : Updated Startdate and Time of the Slot

Name : endDate
Description : Updated Enddate and Time of the Slot (startdate + duration)

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=zp6NYotIeT_Kkb0iIsU02Z0O28E
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/metaslot/1</pre>

#### Body
```javascript
{
  "title" : "New title for a Slot"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/metaslot/1&quot; -d &#39;{&quot;title&quot;:&quot;New title for a Slot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=zp6NYotIeT_Kkb0iIsU02Z0O28E&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Cache-Control: no-cache
X-Request-Id: d4be8489-0d7e-4f15-ae25-8a616f5bd1ec
X-Runtime: 0.009350
Vary: Origin</pre>

#### Status

<pre>204 No Content</pre>

