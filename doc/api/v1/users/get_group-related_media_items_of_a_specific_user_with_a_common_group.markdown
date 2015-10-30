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

<pre>Authorization: Token token=KSTPxgoUIJ5TYjIvHMuOQpO05mg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/173/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/173/media&quot; -X GET \
	-H &quot;Authorization: Token token=KSTPxgoUIJ5TYjIvHMuOQpO05mg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;72083b758f1472776b11d33b5c1b5dcd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 56f59e3b-b430-4aef-984a-92e0a4f53941
X-Runtime: 0.017717
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 254,
    "publicId" : "dfhjghjkdisudgfds7iy308",
    "position" : 30,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.853Z"
  },
  {
    "mediaId" : 255,
    "publicId" : "dfhjghjkdisudgfds7iy309",
    "position" : 31,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.856Z"
  },
  {
    "mediaId" : 256,
    "publicId" : "dfhjghjkdisudgfds7iy310",
    "position" : 32,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.858Z"
  },
  {
    "mediaId" : 257,
    "publicId" : "dfhjghjkdisudgfds7iy311",
    "position" : 33,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.861Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 258,
    "publicId" : "dfhjghjkdisudgfds7iy312",
    "position" : 34,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.863Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 259,
    "publicId" : "dfhjghjkdisudgfds7iy313",
    "position" : 35,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:07.866Z",
    "duration" : null,
    "title" : "Title 309"
  },
  {
    "mediaId" : 260,
    "publicId" : "dfhjghjkdisudgfds7iy314",
    "position" : 36,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.875Z"
  },
  {
    "mediaId" : 261,
    "publicId" : "dfhjghjkdisudgfds7iy315",
    "position" : 37,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.878Z"
  },
  {
    "mediaId" : 262,
    "publicId" : "dfhjghjkdisudgfds7iy316",
    "position" : 38,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.881Z"
  },
  {
    "mediaId" : 263,
    "publicId" : "dfhjghjkdisudgfds7iy317",
    "position" : 39,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.884Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 264,
    "publicId" : "dfhjghjkdisudgfds7iy318",
    "position" : 40,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.887Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 265,
    "publicId" : "dfhjghjkdisudgfds7iy319",
    "position" : 41,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:07.889Z",
    "duration" : null,
    "title" : "Title 315"
  }
]
```
