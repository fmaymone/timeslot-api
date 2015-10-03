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

<pre>Authorization: Token token=zzQwNYHVWUBTTvPGR_6PLr8fcO4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/402/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/402/media&quot; -X GET \
	-H &quot;Authorization: Token token=zzQwNYHVWUBTTvPGR_6PLr8fcO4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0fd13fcff2d04a98c701298eba9af370&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 72e5ce96-e47b-40dd-8192-7888b9e78d7e
X-Runtime: 0.028071
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
    "createdAt" : "2015-09-28T10:16:05.046Z"
  },
  {
    "mediaId" : 295,
    "publicId" : "dfhjghjkdisudgfds7iy284",
    "position" : 31,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:05.049Z"
  },
  {
    "mediaId" : 296,
    "publicId" : "dfhjghjkdisudgfds7iy285",
    "position" : 32,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:05.061Z"
  },
  {
    "mediaId" : 297,
    "publicId" : "dfhjghjkdisudgfds7iy286",
    "position" : 33,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:05.068Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 298,
    "publicId" : "dfhjghjkdisudgfds7iy287",
    "position" : 34,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:05.072Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 299,
    "publicId" : "dfhjghjkdisudgfds7iy288",
    "position" : 35,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-28T10:16:05.075Z",
    "duration" : null,
    "title" : "Title 284"
  },
  {
    "mediaId" : 300,
    "publicId" : "dfhjghjkdisudgfds7iy289",
    "position" : 36,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:05.086Z"
  },
  {
    "mediaId" : 301,
    "publicId" : "dfhjghjkdisudgfds7iy290",
    "position" : 37,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:05.089Z"
  },
  {
    "mediaId" : 302,
    "publicId" : "dfhjghjkdisudgfds7iy291",
    "position" : 38,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:05.091Z"
  },
  {
    "mediaId" : 303,
    "publicId" : "dfhjghjkdisudgfds7iy292",
    "position" : 39,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:05.094Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 304,
    "publicId" : "dfhjghjkdisudgfds7iy293",
    "position" : 40,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:05.117Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 305,
    "publicId" : "dfhjghjkdisudgfds7iy294",
    "position" : 41,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-28T10:16:05.121Z",
    "duration" : null,
    "title" : "Title 290"
  }
]
```
