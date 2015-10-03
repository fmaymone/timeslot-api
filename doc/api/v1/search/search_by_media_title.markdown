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
Authorization: Token token=xnpYBUQQfYUCF7NQpxYL5jI8Heo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=xnpYBUQQfYUCF7NQpxYL5jI8Heo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;261b5b763df5189242f12d5977e78f98&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9b835e6a-99ee-46ff-80ae-97fc6ec06008
X-Runtime: 0.008286
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
    "createdAt" : "2015-10-03T22:30:41.606Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
