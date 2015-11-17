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
Authorization: Token token=ZabSh5uGsZeWqom4oaEEWb80lRc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/media?query=timeslot+2015</pre>

#### Query Parameters

<pre>query: timeslot 2015</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/search/media?query=timeslot+2015&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ZabSh5uGsZeWqom4oaEEWb80lRc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e0ceaf6e34fd8d0a80498387102846e9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a3224587-f9e6-4b49-bb53-25b847134845
X-Runtime: 0.006178
Vary: Origin
Content-Length: 172</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 43,
    "publicId" : "dfhjghjkdisudgfds7iy47",
    "position" : 0,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:13.716Z",
    "duration" : null,
    "thumbnail" : null
  }
]
```
