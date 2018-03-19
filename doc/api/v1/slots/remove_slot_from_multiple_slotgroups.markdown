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
Authorization: Token token=jkhriB4jSm6Ek94GMQVDhOmwp7s
Host: example.org
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/26/slotgroups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/26/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;f4e7bb01-4471-419b-b228-86ded6d031d4&quot;,&quot;da795143-1cde-4bab-9d20-ce55a4047802&quot;,&quot;9bec4e88-22df-4ff4-a90b-46f1534e268f&quot;,&quot;ea854615-294f-4368-bcfa-0b6f21dccbff&quot;,&quot;41ccd569-eadb-4be0-8ff9-c70890e7a503&quot;]}&#39; -X DELETE \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=jkhriB4jSm6Ek94GMQVDhOmwp7s&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e0d9f066a6fdc184dfa15dc84d42a593&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: afd7c641-9f9a-447b-8e17-f6ca3f276e2c
X-Runtime: 0.147598
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
