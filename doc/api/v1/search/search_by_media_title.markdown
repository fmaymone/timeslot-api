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
Authorization: Token token=BNl85h25A6glxlzwX26CSdBOaV0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=BNl85h25A6glxlzwX26CSdBOaV0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bf87aa5a676992e38cb89915452cbdd2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1190503f-8af1-4d56-95da-7e6b1f643ff8
X-Runtime: 0.009857
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
    "createdAt" : "2015-08-30T23:01:47.706Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
