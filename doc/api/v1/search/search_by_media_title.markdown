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
Authorization: Token token=If1cJcXm-i5BNNgj0BpOizTZ32c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=If1cJcXm-i5BNNgj0BpOizTZ32c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3100955ef8a5797da0c40149924f4bc9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 40ea4088-d5d5-4bd8-bc76-ca666c08f49e
X-Runtime: 0.010908
Vary: Origin
Content-Length: 172</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy40",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:03.117Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
