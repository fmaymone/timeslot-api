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
Authorization: Token token=D-yFKiNGXbokdNHk10F9-N8rLdM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=D-yFKiNGXbokdNHk10F9-N8rLdM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3f5cd9e3aeadfc25434fb44255b85301&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bab2f8aa-f046-4314-b1fe-e6c37b477dd6
X-Runtime: 0.005023
Vary: Origin
Content-Length: 172</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 43,
    "publicId" : "dfhjghjkdisudgfds7iy46",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:50.625Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
