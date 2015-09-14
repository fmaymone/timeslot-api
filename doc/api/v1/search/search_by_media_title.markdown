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
Authorization: Token token=1SRojLn0u8Nf9YNUcVm_FYz4zdY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1SRojLn0u8Nf9YNUcVm_FYz4zdY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;742b63b79b9d85a72c71185dcb7de6fc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e54c91eb-60c4-4fd8-bdb8-e2c6b2b9c167
X-Runtime: 0.013100
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
    "createdAt" : "2015-09-14T10:32:42.962Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
