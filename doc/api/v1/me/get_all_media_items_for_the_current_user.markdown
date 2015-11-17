# Me API

## Get all media items for the current user

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=umPoEx_vHnGQTCGVKrU0ngn22tk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=umPoEx_vHnGQTCGVKrU0ngn22tk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e17ae03522774f35108ba652cca087f9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c0e64d6a-35e8-40b7-843f-da7c02ae34c5
X-Runtime: 0.011420
Vary: Origin
Content-Length: 1861</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy23",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:37.832Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy24",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:37.840Z"
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy25",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:37.843Z"
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy26",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:37.845Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 23,
    "publicId" : "dfhjghjkdisudgfds7iy27",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:37.848Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 24,
    "publicId" : "dfhjghjkdisudgfds7iy28",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:37.851Z",
    "duration" : null,
    "title" : "Title 27"
  },
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy29",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:37.864Z"
  },
  {
    "mediaId" : 26,
    "publicId" : "dfhjghjkdisudgfds7iy30",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:37.867Z"
  },
  {
    "mediaId" : 27,
    "publicId" : "dfhjghjkdisudgfds7iy31",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:37.870Z"
  },
  {
    "mediaId" : 28,
    "publicId" : "dfhjghjkdisudgfds7iy32",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:37.872Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy33",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:37.875Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy34",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:37.877Z",
    "duration" : null,
    "title" : "Title 33"
  }
]
```
