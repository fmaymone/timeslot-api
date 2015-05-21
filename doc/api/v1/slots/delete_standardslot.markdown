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

<pre>Authorization: Token token=If9153pmpJbT3mlG_KpVGy479_s
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/36</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/stdslot/36&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=If9153pmpJbT3mlG_KpVGy479_s&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ec123ff7cf05df5018bf4488fca02ce6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3b717992-11ce-42d1-8f4a-dee941c0bfff
X-Runtime: 0.170706
Content-Length: 531</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Slot title 34",
  "createdAt" : "2015-05-19T10:51:51.095Z",
  "updatedAt" : "2015-05-19T10:51:51.243Z",
  "deletedAt" : "2015-05-19T10:51:51.241Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-08T10:44:02.000Z",
  "visibility" : "private",
  "location" : null,
  "creator" : {
    "id" : 171,
    "username" : "User 168",
    "createdAt" : "2015-05-19T10:51:51.092Z",
    "updatedAt" : "2015-05-19T10:51:51.092Z",
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
}
```
