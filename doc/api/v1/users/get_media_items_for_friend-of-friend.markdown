# Users API

## Get media items for Friend-of-Friend

### GET /v1/users/:id/media

Returns an array which includes all media items of the friend which are public- or foaf-visible and if users have shared groups also the media items which the friend has added to this group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=nYPGsXtYT6be0EvXs4T_oeN6fSE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=nYPGsXtYT6be0EvXs4T_oeN6fSE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9cf059de0ec6cc5aa87436344f44bfd6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a6b50b94-24b8-44ca-84d0-3d9a0888336d
X-Runtime: 0.055691
Vary: Origin
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 65,
    "publicId" : "dfhjghjkdisudgfds7iy143",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.476Z"
  },
  {
    "mediaId" : 66,
    "publicId" : "dfhjghjkdisudgfds7iy144",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.478Z"
  },
  {
    "mediaId" : 67,
    "publicId" : "dfhjghjkdisudgfds7iy145",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.481Z"
  },
  {
    "mediaId" : 68,
    "publicId" : "dfhjghjkdisudgfds7iy146",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.483Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 69,
    "publicId" : "dfhjghjkdisudgfds7iy147",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.486Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 70,
    "publicId" : "dfhjghjkdisudgfds7iy148",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.488Z",
    "duration" : null,
    "title" : "Title 147"
  },
  {
    "mediaId" : 71,
    "publicId" : "dfhjghjkdisudgfds7iy149",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.497Z"
  },
  {
    "mediaId" : 72,
    "publicId" : "dfhjghjkdisudgfds7iy150",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.500Z"
  },
  {
    "mediaId" : 73,
    "publicId" : "dfhjghjkdisudgfds7iy151",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.504Z"
  },
  {
    "mediaId" : 74,
    "publicId" : "dfhjghjkdisudgfds7iy152",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.507Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 75,
    "publicId" : "dfhjghjkdisudgfds7iy153",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.509Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 76,
    "publicId" : "dfhjghjkdisudgfds7iy154",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.511Z",
    "duration" : null,
    "title" : "Title 153"
  },
  {
    "mediaId" : 89,
    "publicId" : "dfhjghjkdisudgfds7iy167",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.577Z"
  },
  {
    "mediaId" : 90,
    "publicId" : "dfhjghjkdisudgfds7iy168",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.579Z"
  },
  {
    "mediaId" : 91,
    "publicId" : "dfhjghjkdisudgfds7iy169",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.582Z"
  },
  {
    "mediaId" : 92,
    "publicId" : "dfhjghjkdisudgfds7iy170",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.584Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 93,
    "publicId" : "dfhjghjkdisudgfds7iy171",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.586Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 94,
    "publicId" : "dfhjghjkdisudgfds7iy172",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.589Z",
    "duration" : null,
    "title" : "Title 171"
  }
]
```
