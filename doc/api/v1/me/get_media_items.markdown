# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=AjwrJpNkgvbdEz_vaAf_gEOET_w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=AjwrJpNkgvbdEz_vaAf_gEOET_w&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3c39eecd4167ebedbdd66172b4abc69a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 045c36ad-04c3-4744-85ad-f005d2776640
X-Runtime: 0.012943
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
    "createdAt" : "2015-12-04T16:56:49.157Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy23",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:49.160Z"
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy24",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:49.163Z"
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy25",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:49.166Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 23,
    "publicId" : "dfhjghjkdisudgfds7iy26",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:49.168Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 24,
    "publicId" : "dfhjghjkdisudgfds7iy27",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:49.171Z",
    "duration" : null,
    "title" : "Title 27"
  },
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy28",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:49.188Z"
  },
  {
    "mediaId" : 26,
    "publicId" : "dfhjghjkdisudgfds7iy29",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:49.194Z"
  },
  {
    "mediaId" : 27,
    "publicId" : "dfhjghjkdisudgfds7iy30",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:49.197Z"
  },
  {
    "mediaId" : 28,
    "publicId" : "dfhjghjkdisudgfds7iy31",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:49.199Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy32",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:49.202Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy33",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:49.205Z",
    "duration" : null,
    "title" : "Title 33"
  }
]
```
