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
Authorization: Token token=Vqc2sd84OFO1q-XGHi9eyzZgXcA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Vqc2sd84OFO1q-XGHi9eyzZgXcA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5b803a3be054493c1912717b62be0a5c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fd5f79de-6537-4df1-8761-39fa891f89ec
X-Runtime: 0.012542
Vary: Origin
Content-Length: 170</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 8,
    "publicId" : "dfhjghjkdisudgfds7iy5",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-20T18:49:24.940Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
