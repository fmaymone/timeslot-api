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
Authorization: Token token=HOMlHgxcRJ8uQPVnwPvotDw8whE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=HOMlHgxcRJ8uQPVnwPvotDw8whE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;09f914135cb3d610b74acee0fab0407e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 51c0d262-101f-46aa-a496-578aeb1f3bb5
X-Runtime: 0.005785
Vary: Origin
Content-Length: 172</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy46",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:33.418Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
