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
Authorization: Token token=Nyzi9_v1l9T9hEBNzSRhw2rPFRM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Nyzi9_v1l9T9hEBNzSRhw2rPFRM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dee22b8e64ceb2095a515de205a58d44&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 13df743d-0d3f-48a1-bb00-d1b01fae237a
X-Runtime: 0.005995
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
    "createdAt" : "2015-11-24T23:47:32.014Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
