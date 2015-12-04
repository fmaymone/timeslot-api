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

<pre>Authorization: Token token=vIItezPfgKP_YsXQbVqIcOpTrAo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/108/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/108/media&quot; -X GET \
	-H &quot;Authorization: Token token=vIItezPfgKP_YsXQbVqIcOpTrAo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;26fff9f6ce3cabf7664a0494c7f8dcbf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 37f7a921-c3be-4fc4-a5fa-0c9f01013e2b
X-Runtime: 0.031908
Vary: Origin
Content-Length: 3759</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy107",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.254Z"
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy108",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.257Z"
  },
  {
    "mediaId" : 31,
    "publicId" : "dfhjghjkdisudgfds7iy109",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.259Z"
  },
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy110",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.261Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy111",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.264Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy112",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.266Z",
    "duration" : null,
    "title" : "Title 111"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy113",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.275Z"
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy114",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.278Z"
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy115",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.281Z"
  },
  {
    "mediaId" : 38,
    "publicId" : "dfhjghjkdisudgfds7iy116",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.285Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 39,
    "publicId" : "dfhjghjkdisudgfds7iy117",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.290Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 40,
    "publicId" : "dfhjghjkdisudgfds7iy118",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.295Z",
    "duration" : null,
    "title" : "Title 117"
  },
  {
    "mediaId" : 41,
    "publicId" : "dfhjghjkdisudgfds7iy119",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.304Z"
  },
  {
    "mediaId" : 42,
    "publicId" : "dfhjghjkdisudgfds7iy120",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.307Z"
  },
  {
    "mediaId" : 43,
    "publicId" : "dfhjghjkdisudgfds7iy121",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.309Z"
  },
  {
    "mediaId" : 44,
    "publicId" : "dfhjghjkdisudgfds7iy122",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.312Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 45,
    "publicId" : "dfhjghjkdisudgfds7iy123",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.314Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 46,
    "publicId" : "dfhjghjkdisudgfds7iy124",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.317Z",
    "duration" : null,
    "title" : "Title 123"
  },
  {
    "mediaId" : 53,
    "publicId" : "dfhjghjkdisudgfds7iy131",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.355Z"
  },
  {
    "mediaId" : 54,
    "publicId" : "dfhjghjkdisudgfds7iy132",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.357Z"
  },
  {
    "mediaId" : 55,
    "publicId" : "dfhjghjkdisudgfds7iy133",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.359Z"
  },
  {
    "mediaId" : 56,
    "publicId" : "dfhjghjkdisudgfds7iy134",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.362Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 57,
    "publicId" : "dfhjghjkdisudgfds7iy135",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.364Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 58,
    "publicId" : "dfhjghjkdisudgfds7iy136",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.366Z",
    "duration" : null,
    "title" : "Title 135"
  }
]
```
