# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=KhkcVfOlhlpmvEDZZPqeP9e7rrs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=KhkcVfOlhlpmvEDZZPqeP9e7rrs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b22f95a470bd77505cacb0f2cb0d5015&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f23b031f-39e0-4465-b1f8-47d5b01ba949
X-Runtime: 0.021409
Content-Length: 1866</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 1,
    "publicId" : "dfhjghjkdisudgfds7iy382",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:50:53.809Z"
  },
  {
    "mediaId" : 2,
    "publicId" : "dfhjghjkdisudgfds7iy383",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:50:53.811Z"
  },
  {
    "mediaId" : 3,
    "publicId" : "dfhjghjkdisudgfds7iy384",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:50:53.814Z"
  },
  {
    "mediaId" : 4,
    "publicId" : "dfhjghjkdisudgfds7iy385",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:50:53.816Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 5,
    "publicId" : "dfhjghjkdisudgfds7iy386",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:50:53.818Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 6,
    "publicId" : "dfhjghjkdisudgfds7iy387",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:50:53.821Z",
    "duration" : null,
    "title" : "Title 387"
  },
  {
    "mediaId" : 7,
    "publicId" : "dfhjghjkdisudgfds7iy388",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:50:53.836Z"
  },
  {
    "mediaId" : 8,
    "publicId" : "dfhjghjkdisudgfds7iy389",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:50:53.846Z"
  },
  {
    "mediaId" : 9,
    "publicId" : "dfhjghjkdisudgfds7iy390",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:50:53.848Z"
  },
  {
    "mediaId" : 10,
    "publicId" : "dfhjghjkdisudgfds7iy391",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:50:53.850Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 11,
    "publicId" : "dfhjghjkdisudgfds7iy392",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:50:53.852Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 12,
    "publicId" : "dfhjghjkdisudgfds7iy393",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:50:53.854Z",
    "duration" : null,
    "title" : "Title 393"
  }
]
```
