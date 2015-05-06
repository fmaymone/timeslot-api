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

<pre>Authorization: Token token=qyDXiOTUL19nTT_TedFVCM_TXVc
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/36</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/36&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=qyDXiOTUL19nTT_TedFVCM_TXVc&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;922dfacf1491f6d092c85a50d8ae0681&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7e661b7f-71a7-4ff8-b981-6e44826f17a7
X-Runtime: 0.122714
Content-Length: 531</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 36,
  "title" : "Slot title 34",
  "createdAt" : "2015-05-06T11:28:51.160Z",
  "updatedAt" : "2015-05-06T11:28:51.263Z",
  "deletedAt" : "2015-05-06T11:28:51.261Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-08T10:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 161,
    "username" : "User 161",
    "createdAt" : "2015-05-06T11:28:51.159Z",
    "updatedAt" : "2015-05-06T11:28:51.159Z",
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
