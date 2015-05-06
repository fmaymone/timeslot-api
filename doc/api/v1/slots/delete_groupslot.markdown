# Slots API

## Delete GroupSlot

### DELETE /v1/groupslot/:id

Sets &#39;deletedAt&#39;, returns updated Group Slot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Group Slot to delete

### Request

#### Headers

<pre>Authorization: Token token=eUaNNpM4RTQYXm6Q99Kw3I8YhzA
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groupslot/38</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groupslot/38&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=eUaNNpM4RTQYXm6Q99Kw3I8YhzA&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;2a27ce48fc9bc86a1944c3420cdca017&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a6493e89-862a-4013-9840-c69e5e9c993d
X-Runtime: 0.046360
Content-Length: 539</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 38,
  "title" : "Slot title 36",
  "createdAt" : "2015-05-06T11:28:51.332Z",
  "updatedAt" : "2015-05-06T11:28:51.355Z",
  "deletedAt" : "2015-05-06T11:28:51.353Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-10T12:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 165,
    "username" : "User 165",
    "createdAt" : "2015-05-06T11:28:51.330Z",
    "updatedAt" : "2015-05-06T11:28:51.330Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "groupId" : 41,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}</pre>
