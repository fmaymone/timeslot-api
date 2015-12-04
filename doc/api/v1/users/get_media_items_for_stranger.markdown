# Users API

## Get media items for Stranger

### GET /v1/users/:id/media

Returns an array which includes all public media items of a specific user and media items this user has added to common groups.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=aLHFIehdaF32WRWRb1OOA0hm4Tc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/129/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/129/media&quot; -X GET \
	-H &quot;Authorization: Token token=aLHFIehdaF32WRWRb1OOA0hm4Tc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ce32f2170b74764f29543a4bb4741115&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3185a896-7828-4407-86aa-ece7995340b0
X-Runtime: 0.022290
Vary: Origin
Content-Length: 1891</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 101,
    "publicId" : "dfhjghjkdisudgfds7iy179",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.739Z"
  },
  {
    "mediaId" : 102,
    "publicId" : "dfhjghjkdisudgfds7iy180",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.741Z"
  },
  {
    "mediaId" : 103,
    "publicId" : "dfhjghjkdisudgfds7iy181",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.744Z"
  },
  {
    "mediaId" : 104,
    "publicId" : "dfhjghjkdisudgfds7iy182",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.746Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 105,
    "publicId" : "dfhjghjkdisudgfds7iy183",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.749Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 106,
    "publicId" : "dfhjghjkdisudgfds7iy184",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.751Z",
    "duration" : null,
    "title" : "Title 183"
  },
  {
    "mediaId" : 125,
    "publicId" : "dfhjghjkdisudgfds7iy203",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.839Z"
  },
  {
    "mediaId" : 126,
    "publicId" : "dfhjghjkdisudgfds7iy204",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.842Z"
  },
  {
    "mediaId" : 127,
    "publicId" : "dfhjghjkdisudgfds7iy205",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.844Z"
  },
  {
    "mediaId" : 128,
    "publicId" : "dfhjghjkdisudgfds7iy206",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.846Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 129,
    "publicId" : "dfhjghjkdisudgfds7iy207",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.849Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 130,
    "publicId" : "dfhjghjkdisudgfds7iy208",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.851Z",
    "duration" : null,
    "title" : "Title 207"
  }
]
```
