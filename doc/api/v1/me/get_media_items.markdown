# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=B5_sLvSYC73qt9inqdpD7d2ZJNU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=B5_sLvSYC73qt9inqdpD7d2ZJNU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1584196e956f1a318ccb53cdbe25099f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2d460b8d-205e-408f-8cfd-7e2785157dc8
X-Runtime: 0.011667
Vary: Origin
Content-Length: 1861</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy22",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:30.856Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy23",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:30.858Z"
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy24",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:30.861Z"
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy25",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:30.863Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 23,
    "publicId" : "dfhjghjkdisudgfds7iy26",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:30.866Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 24,
    "publicId" : "dfhjghjkdisudgfds7iy27",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-24T23:47:30.868Z",
    "duration" : null,
    "title" : "Title 27"
  },
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy28",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:30.886Z"
  },
  {
    "mediaId" : 26,
    "publicId" : "dfhjghjkdisudgfds7iy29",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:30.890Z"
  },
  {
    "mediaId" : 27,
    "publicId" : "dfhjghjkdisudgfds7iy30",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:30.896Z"
  },
  {
    "mediaId" : 28,
    "publicId" : "dfhjghjkdisudgfds7iy31",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:30.899Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy32",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:30.901Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy33",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-24T23:47:30.904Z",
    "duration" : null,
    "title" : "Title 33"
  }
]
```
