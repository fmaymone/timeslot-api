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

<pre>Authorization: Token token=HHqx1YYmblXFgZ-dBSMRa3Dxkt4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/41</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot/41&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=HHqx1YYmblXFgZ-dBSMRa3Dxkt4&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;58d260e9afaf0a3c203f417f30e7c32c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d3b42d5e-7739-4572-8058-a3ff2a0d16ef
X-Runtime: 0.050533
Content-Length: 542</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 41,
  "title" : "Slot title 39",
  "createdAt" : "2015-05-06T21:29:37.797Z",
  "updatedAt" : "2015-05-06T21:29:37.829Z",
  "deletedAt" : "2015-05-06T21:29:37.824Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-13T15:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 171,
    "username" : "User 171",
    "createdAt" : "2015-05-06T21:29:37.801Z",
    "updatedAt" : "2015-05-06T21:29:37.801Z",
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
}
```
