# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=ghP-PDS-vnQxHGPRciSSv2IdEeY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=ghP-PDS-vnQxHGPRciSSv2IdEeY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d1325beeda010582dcc5dabacdb0fe51&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fe9ef4db-5dee-499d-ac9e-de801193bd4b
X-Runtime: 0.012411
Vary: Origin
Content-Length: 1852</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 1,
    "publicId" : "dfhjghjkdisudgfds7iy22",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:01.216Z"
  },
  {
    "mediaId" : 2,
    "publicId" : "dfhjghjkdisudgfds7iy23",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:01.220Z"
  },
  {
    "mediaId" : 3,
    "publicId" : "dfhjghjkdisudgfds7iy24",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:01.223Z"
  },
  {
    "mediaId" : 4,
    "publicId" : "dfhjghjkdisudgfds7iy25",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:01.226Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 5,
    "publicId" : "dfhjghjkdisudgfds7iy26",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:01.229Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 6,
    "publicId" : "dfhjghjkdisudgfds7iy27",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:01.232Z",
    "duration" : null,
    "title" : "Title 27"
  },
  {
    "mediaId" : 7,
    "publicId" : "dfhjghjkdisudgfds7iy28",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:01.247Z"
  },
  {
    "mediaId" : 8,
    "publicId" : "dfhjghjkdisudgfds7iy29",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:01.250Z"
  },
  {
    "mediaId" : 9,
    "publicId" : "dfhjghjkdisudgfds7iy30",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:01.253Z"
  },
  {
    "mediaId" : 10,
    "publicId" : "dfhjghjkdisudgfds7iy31",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:01.257Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 11,
    "publicId" : "dfhjghjkdisudgfds7iy32",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:01.261Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 12,
    "publicId" : "dfhjghjkdisudgfds7iy33",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:01.265Z",
    "duration" : null,
    "title" : "Title 33"
  }
]
```
