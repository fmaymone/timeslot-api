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
Authorization: Token token=WFnMrRtAOlZtDYW8Ezco2_HSM1k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=WFnMrRtAOlZtDYW8Ezco2_HSM1k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;918d37df84a516deb6ca8a3b65825b0c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a8d1b0ce-71d5-4768-9fb3-7ffdcff3ade2
X-Runtime: 0.007968
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
    "createdAt" : "2016-04-04T20:50:26.126Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
