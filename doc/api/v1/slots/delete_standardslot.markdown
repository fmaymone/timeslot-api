# Slots API

## Delete StandardSlot

### DELETE /v1/stdslot/:id

Sets &#39;deletedAt&#39;, returns updated Standard Slot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot to delete

### Request

#### Headers

<pre>Authorization: Token token=pOXpSV4jB-a6hsY30T56ZZROnwI
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/36</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/36&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=pOXpSV4jB-a6hsY30T56ZZROnwI&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;a1ecddc215c95224de5deaa64016949a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 30c90e57-b188-47b0-bf75-62a05791aaa0
X-Runtime: 0.122406
Content-Length: 531</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 36,
  "title" : "Slot title 34",
  "createdAt" : "2015-05-06T14:45:16.566Z",
  "updatedAt" : "2015-05-06T14:45:16.668Z",
  "deletedAt" : "2015-05-06T14:45:16.666Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-08T10:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 161,
    "username" : "User 161",
    "createdAt" : "2015-05-06T14:45:16.564Z",
    "updatedAt" : "2015-05-06T14:45:16.564Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}</pre>
