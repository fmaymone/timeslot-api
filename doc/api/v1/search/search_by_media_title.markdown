# Search API

## Search by media title

### GET /v1/search/media

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : signature
Description : Signature for cloudinary upload

Name : pulicId
Description : ID for the resource to be uploaded

Name : timestamp
Description : Timestamp

Name : apiKey
Description : API Key

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=j12Ar9RrMdKVmtVRRUDZytinFi0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=j12Ar9RrMdKVmtVRRUDZytinFi0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7074474e047d5e42a6895d4f555dc38a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f38f7119-cfb1-4a99-b51c-5d7e8e3f2bc0
X-Runtime: 0.008272
Vary: Origin
Content-Length: 172</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy23",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:03.254Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
