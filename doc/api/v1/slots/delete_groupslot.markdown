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

<pre>Authorization: Token token=IvvgaflO1ZIeIyL5d2mcFk9Yc-I
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groupslot/38</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groupslot/38&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=IvvgaflO1ZIeIyL5d2mcFk9Yc-I&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d0ee5a021afc874be11ed9c39c6b26aa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 89917e6a-b9ff-4872-8343-3eedcfcbdab8
X-Runtime: 0.047073
Content-Length: 539</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 38,
  "title" : "Slot title 36",
  "createdAt" : "2015-05-19T10:51:51.327Z",
  "updatedAt" : "2015-05-19T10:51:51.350Z",
  "deletedAt" : "2015-05-19T10:51:51.347Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-10T12:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 175,
    "username" : "User 172",
    "createdAt" : "2015-05-19T10:51:51.321Z",
    "updatedAt" : "2015-05-19T10:51:51.321Z",
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
}
```
