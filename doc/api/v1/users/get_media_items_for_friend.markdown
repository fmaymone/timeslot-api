# Users API

## Get media items for Friend

### GET /v1/users/:id/media

Returns an array which includes all media items of the friend which are public-, friend- or foaf-visible and if users have shared groups also the media items which the friend has added to this group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=93UXRmdwLdba7QXrR-C67TEGFW4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/138/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/138/media&quot; -X GET \
	-H &quot;Authorization: Token token=93UXRmdwLdba7QXrR-C67TEGFW4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;93e253fab44af218ab02b71f7794c015&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4bfb72da-213f-419f-88f7-f1d73b87ee57
X-Runtime: 0.030686
Vary: Origin
Content-Length: 2791</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 5,
    "publicId" : "dfhjghjkdisudgfds7iy71",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.775Z"
  },
  {
    "mediaId" : 6,
    "publicId" : "dfhjghjkdisudgfds7iy72",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.780Z"
  },
  {
    "mediaId" : 7,
    "publicId" : "dfhjghjkdisudgfds7iy73",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.784Z"
  },
  {
    "mediaId" : 8,
    "publicId" : "dfhjghjkdisudgfds7iy74",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.787Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 9,
    "publicId" : "dfhjghjkdisudgfds7iy75",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.791Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 10,
    "publicId" : "dfhjghjkdisudgfds7iy76",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:17.796Z",
    "duration" : null,
    "title" : "Title 75"
  },
  {
    "mediaId" : 11,
    "publicId" : "dfhjghjkdisudgfds7iy77",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.812Z"
  },
  {
    "mediaId" : 12,
    "publicId" : "dfhjghjkdisudgfds7iy78",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.815Z"
  },
  {
    "mediaId" : 13,
    "publicId" : "dfhjghjkdisudgfds7iy79",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.819Z"
  },
  {
    "mediaId" : 14,
    "publicId" : "dfhjghjkdisudgfds7iy80",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.822Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 15,
    "publicId" : "dfhjghjkdisudgfds7iy81",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.826Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 16,
    "publicId" : "dfhjghjkdisudgfds7iy82",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:17.829Z",
    "duration" : null,
    "title" : "Title 81"
  },
  {
    "mediaId" : 17,
    "publicId" : "dfhjghjkdisudgfds7iy83",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.844Z"
  },
  {
    "mediaId" : 18,
    "publicId" : "dfhjghjkdisudgfds7iy84",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.847Z"
  },
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy85",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.850Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy86",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.854Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy87",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.857Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy88",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:17.860Z",
    "duration" : null,
    "title" : "Title 87"
  }
]
```
