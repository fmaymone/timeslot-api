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

<pre>Authorization: Token token=2lHeqmRcE8El9KGVWNX1GN3QQrg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=2lHeqmRcE8El9KGVWNX1GN3QQrg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;56f711da7cd5bbb91f028168bce7da54&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c14aa9a9-e64f-42e9-8170-968ca9250f01
X-Runtime: 0.031957
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
    "createdAt" : "2015-11-24T23:47:35.841Z"
  },
  {
    "mediaId" : 66,
    "publicId" : "dfhjghjkdisudgfds7iy144",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.844Z"
  },
  {
    "mediaId" : 67,
    "publicId" : "dfhjghjkdisudgfds7iy145",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.848Z"
  },
  {
    "mediaId" : 68,
    "publicId" : "dfhjghjkdisudgfds7iy146",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:35.851Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 69,
    "publicId" : "dfhjghjkdisudgfds7iy147",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:35.854Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 70,
    "publicId" : "dfhjghjkdisudgfds7iy148",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-24T23:47:35.857Z",
    "duration" : null,
    "title" : "Title 147"
  },
  {
    "mediaId" : 71,
    "publicId" : "dfhjghjkdisudgfds7iy149",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.875Z"
  },
  {
    "mediaId" : 72,
    "publicId" : "dfhjghjkdisudgfds7iy150",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.880Z"
  },
  {
    "mediaId" : 73,
    "publicId" : "dfhjghjkdisudgfds7iy151",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.884Z"
  },
  {
    "mediaId" : 74,
    "publicId" : "dfhjghjkdisudgfds7iy152",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:35.886Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 75,
    "publicId" : "dfhjghjkdisudgfds7iy153",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:35.888Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 76,
    "publicId" : "dfhjghjkdisudgfds7iy154",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-24T23:47:35.891Z",
    "duration" : null,
    "title" : "Title 153"
  },
  {
    "mediaId" : 89,
    "publicId" : "dfhjghjkdisudgfds7iy167",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.956Z"
  },
  {
    "mediaId" : 90,
    "publicId" : "dfhjghjkdisudgfds7iy168",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.962Z"
  },
  {
    "mediaId" : 91,
    "publicId" : "dfhjghjkdisudgfds7iy169",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-24T23:47:35.965Z"
  },
  {
    "mediaId" : 92,
    "publicId" : "dfhjghjkdisudgfds7iy170",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:35.968Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 93,
    "publicId" : "dfhjghjkdisudgfds7iy171",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-24T23:47:35.970Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 94,
    "publicId" : "dfhjghjkdisudgfds7iy172",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-24T23:47:35.973Z",
    "duration" : null,
    "title" : "Title 171"
  }
]
```
