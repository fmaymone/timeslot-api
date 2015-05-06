# Slots API

## Delete ReSlot

### DELETE /v1/reslot/:id

Sets &#39;deletedAt&#39;, returns updated reslot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the ReSlot to delete

### Request

#### Headers

<pre>Authorization: Token token=dQbmbeawzTFtivRPckI3c9J-42Q
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/41</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot/41&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=dQbmbeawzTFtivRPckI3c9J-42Q&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;bedc736152fa39f0ea621e88e9a23e4b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a242a5d2-6105-418a-b61c-a7a8171de230
X-Runtime: 0.036848
Content-Length: 542</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 41,
  "title" : "Slot title 39",
  "createdAt" : "2015-05-06T11:28:51.420Z",
  "updatedAt" : "2015-05-06T11:28:51.452Z",
  "deletedAt" : "2015-05-06T11:28:51.449Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-13T15:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 171,
    "username" : "User 171",
    "createdAt" : "2015-05-06T11:28:51.425Z",
    "updatedAt" : "2015-05-06T11:28:51.425Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotterId" : 168,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}</pre>
