# Users API

## Get all media items of a specific user

### GET /v1/users/:id/media

Returns an array which includes all media items of the given user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=A5BArQspQkm1S_KyeIQiGXLODuA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/279/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/279/media&quot; -X GET \
	-H &quot;Authorization: Token token=A5BArQspQkm1S_KyeIQiGXLODuA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;99c3f83cc9a5c935d4659cc8609d4dd1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f86b4eee-d9cb-44c9-a633-99bd64f578cd
X-Runtime: 0.031041
Content-Length: 1849</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 83,
    "publicId" : "dfhjghjkdisudgfds7iy72",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-08-01T21:43:32.727Z"
  },
  {
    "mediaId" : 84,
    "publicId" : "dfhjghjkdisudgfds7iy73",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-08-01T21:43:32.737Z"
  },
  {
    "mediaId" : 85,
    "publicId" : "dfhjghjkdisudgfds7iy74",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-08-01T21:43:32.747Z"
  },
  {
    "mediaId" : 86,
    "publicId" : "dfhjghjkdisudgfds7iy75",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-08-01T21:43:32.757Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 87,
    "publicId" : "dfhjghjkdisudgfds7iy76",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-08-01T21:43:32.767Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 88,
    "publicId" : "dfhjghjkdisudgfds7iy77",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-08-01T21:43:32.777Z",
    "duration" : null,
    "title" : null
  },
  {
    "mediaId" : 89,
    "publicId" : "dfhjghjkdisudgfds7iy78",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-08-01T21:43:32.807Z"
  },
  {
    "mediaId" : 90,
    "publicId" : "dfhjghjkdisudgfds7iy79",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-08-01T21:43:32.817Z"
  },
  {
    "mediaId" : 91,
    "publicId" : "dfhjghjkdisudgfds7iy80",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-08-01T21:43:32.827Z"
  },
  {
    "mediaId" : 92,
    "publicId" : "dfhjghjkdisudgfds7iy81",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-08-01T21:43:32.847Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 93,
    "publicId" : "dfhjghjkdisudgfds7iy82",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-08-01T21:43:32.857Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 94,
    "publicId" : "dfhjghjkdisudgfds7iy83",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-08-01T21:43:32.857Z",
    "duration" : null,
    "title" : null
  }
]
```
