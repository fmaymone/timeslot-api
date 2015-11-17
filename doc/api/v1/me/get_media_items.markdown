# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=55ArR2pTTVukgNT_CEUDVr2VQBM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=55ArR2pTTVukgNT_CEUDVr2VQBM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6d251a25acd183e8841f575125861b9e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9a7a0808-a01d-4b18-932e-ca3e56e2147c
X-Runtime: 0.011158
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
    "createdAt" : "2015-11-17T23:46:12.536Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy24",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:12.539Z"
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy25",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:12.542Z"
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy26",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:12.545Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 23,
    "publicId" : "dfhjghjkdisudgfds7iy27",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:12.547Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 24,
    "publicId" : "dfhjghjkdisudgfds7iy28",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:12.550Z",
    "duration" : null,
    "title" : "Title 27"
  },
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy29",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:12.569Z"
  },
  {
    "mediaId" : 26,
    "publicId" : "dfhjghjkdisudgfds7iy30",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:12.571Z"
  },
  {
    "mediaId" : 27,
    "publicId" : "dfhjghjkdisudgfds7iy31",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:12.573Z"
  },
  {
    "mediaId" : 28,
    "publicId" : "dfhjghjkdisudgfds7iy32",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:12.576Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy33",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:12.578Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy34",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:12.580Z",
    "duration" : null,
    "title" : "Title 33"
  }
]
```
