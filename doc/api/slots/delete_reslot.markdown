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

<pre>Authorization: Token token=ZlWbcpMdyHiEu2ENXRhZW-jt32c
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/41</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot/41&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=ZlWbcpMdyHiEu2ENXRhZW-jt32c&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;df0faa9e7038836821298b6ce2d5ca52&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dede799f-c69f-4c77-8905-3582c11655c3
X-Runtime: 0.046287
Content-Length: 542</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 41,
  "title" : "Slot title 39",
  "createdAt" : "2015-05-19T10:51:51.443Z",
  "updatedAt" : "2015-05-19T10:51:51.478Z",
  "deletedAt" : "2015-05-19T10:51:51.474Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-13T15:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 181,
    "username" : "User 178",
    "createdAt" : "2015-05-19T10:51:51.448Z",
    "updatedAt" : "2015-05-19T10:51:51.448Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotterId" : 178,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
