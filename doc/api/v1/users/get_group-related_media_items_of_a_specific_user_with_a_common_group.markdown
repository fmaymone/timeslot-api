# Users API

## Get group-related media items of a specific user with a common group

### GET /v1/users/:id/media

Returns an array which includes all media items of a specific user with a common group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=fghQVg1CQdZzzrkffP3EcvAE3GE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/388/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/388/media&quot; -X GET \
	-H &quot;Authorization: Token token=fghQVg1CQdZzzrkffP3EcvAE3GE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b1f23ba8945d3e04e037d5e11b25f017&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 987c68bc-e8e4-4886-a307-e5ecd6d7cca3
X-Runtime: 0.028960
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 294,
    "publicId" : "dfhjghjkdisudgfds7iy283",
    "position" : 30,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:04.792Z"
  },
  {
    "mediaId" : 295,
    "publicId" : "dfhjghjkdisudgfds7iy284",
    "position" : 31,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:04.796Z"
  },
  {
    "mediaId" : 296,
    "publicId" : "dfhjghjkdisudgfds7iy285",
    "position" : 32,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:04.805Z"
  },
  {
    "mediaId" : 297,
    "publicId" : "dfhjghjkdisudgfds7iy286",
    "position" : 33,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:04.808Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 298,
    "publicId" : "dfhjghjkdisudgfds7iy287",
    "position" : 34,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:04.812Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 299,
    "publicId" : "dfhjghjkdisudgfds7iy288",
    "position" : 35,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-14T10:33:04.818Z",
    "duration" : null,
    "title" : "Title 284"
  },
  {
    "mediaId" : 300,
    "publicId" : "dfhjghjkdisudgfds7iy289",
    "position" : 36,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:04.829Z"
  },
  {
    "mediaId" : 301,
    "publicId" : "dfhjghjkdisudgfds7iy290",
    "position" : 37,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:04.832Z"
  },
  {
    "mediaId" : 302,
    "publicId" : "dfhjghjkdisudgfds7iy291",
    "position" : 38,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:04.835Z"
  },
  {
    "mediaId" : 303,
    "publicId" : "dfhjghjkdisudgfds7iy292",
    "position" : 39,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:04.838Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 304,
    "publicId" : "dfhjghjkdisudgfds7iy293",
    "position" : 40,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:04.848Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 305,
    "publicId" : "dfhjghjkdisudgfds7iy294",
    "position" : 41,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-14T10:33:04.851Z",
    "duration" : null,
    "title" : "Title 290"
  }
]
```
