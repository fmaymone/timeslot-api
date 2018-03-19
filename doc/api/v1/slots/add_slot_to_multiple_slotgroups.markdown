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
Authorization: Token token=PgGranVlxHZ9EJm3VcaKZIgWsXA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots/23/slotgroups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/slots/23/slotgroups&quot; -d &#39;{&quot;slotGroups&quot;:[&quot;a06481f2-66d4-49c7-b6c7-65b36f092e21&quot;,&quot;de1273ec-5928-47a8-a7eb-e2c2bab1a670&quot;,&quot;66ca0dd7-05c9-4fc3-a614-0238db0b2992&quot;,&quot;a03154cf-9abd-4923-9a2c-4ead2ae968cc&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=PgGranVlxHZ9EJm3VcaKZIgWsXA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4f130a2d6786308f61b4b63375150f3e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bb478f02-fbdb-4765-aace-843479e12e04
X-Runtime: 0.216450
Content-Length: 106</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
