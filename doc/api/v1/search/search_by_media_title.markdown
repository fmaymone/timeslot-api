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
Authorization: Token token=12iFIHC3EE6Tcsng1GhIXFBpf8c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=12iFIHC3EE6Tcsng1GhIXFBpf8c&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8210a0a3e4fd176c6b3d2bdf2fd966e8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b348a2dd-f867-4213-9bd7-153efb2a93ff
X-Runtime: 0.014520
Content-Length: 173</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy400",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:50:56.234Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
