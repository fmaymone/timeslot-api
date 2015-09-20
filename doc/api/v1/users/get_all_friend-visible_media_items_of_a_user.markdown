# Users API

## Get all friend-visible media items of a user

### GET /v1/users/:id/media

Returns an array which includes all media items of this user which are public or friend-visible.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=b56cZmGkSjm-UWr_OVfsywNzcQE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/388/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/388/media&quot; -X GET \
	-H &quot;Authorization: Token token=b56cZmGkSjm-UWr_OVfsywNzcQE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;54884338ce8f0367a54d586bad77c828&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2e7e6f3b-6564-46f8-b879-7915c408be02
X-Runtime: 0.025793
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 228,
    "publicId" : "dfhjghjkdisudgfds7iy217",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-20T18:49:43.831Z"
  },
  {
    "mediaId" : 229,
    "publicId" : "dfhjghjkdisudgfds7iy218",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-20T18:49:43.834Z"
  },
  {
    "mediaId" : 230,
    "publicId" : "dfhjghjkdisudgfds7iy219",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-20T18:49:43.837Z"
  },
  {
    "mediaId" : 231,
    "publicId" : "dfhjghjkdisudgfds7iy220",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-20T18:49:43.840Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 232,
    "publicId" : "dfhjghjkdisudgfds7iy221",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-20T18:49:43.843Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 233,
    "publicId" : "dfhjghjkdisudgfds7iy222",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-20T18:49:43.845Z",
    "duration" : null,
    "title" : "Title 218"
  },
  {
    "mediaId" : 234,
    "publicId" : "dfhjghjkdisudgfds7iy223",
    "position" : 18,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-20T18:49:43.867Z"
  },
  {
    "mediaId" : 235,
    "publicId" : "dfhjghjkdisudgfds7iy224",
    "position" : 19,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-20T18:49:43.873Z"
  },
  {
    "mediaId" : 236,
    "publicId" : "dfhjghjkdisudgfds7iy225",
    "position" : 20,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-20T18:49:43.877Z"
  },
  {
    "mediaId" : 237,
    "publicId" : "dfhjghjkdisudgfds7iy226",
    "position" : 21,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-20T18:49:43.880Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 238,
    "publicId" : "dfhjghjkdisudgfds7iy227",
    "position" : 22,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-20T18:49:43.883Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 239,
    "publicId" : "dfhjghjkdisudgfds7iy228",
    "position" : 23,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-20T18:49:43.885Z",
    "duration" : null,
    "title" : "Title 224"
  }
]
```
