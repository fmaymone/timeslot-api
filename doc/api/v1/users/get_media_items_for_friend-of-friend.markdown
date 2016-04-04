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

<pre>Authorization: Token token=WJP2PmrlNmJ5dGPZcFpXif12tqk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/132/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/132/media&quot; -X GET \
	-H &quot;Authorization: Token token=WJP2PmrlNmJ5dGPZcFpXif12tqk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;480f3586eda2b525e37a1537ad38886d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 080ab54f-b348-4a5c-8148-7e1a8e921ae9
X-Runtime: 0.023500
Vary: Origin
Content-Length: 1861</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy81",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.737Z"
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy82",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.739Z"
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy83",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.741Z"
  },
  {
    "mediaId" : 38,
    "publicId" : "dfhjghjkdisudgfds7iy84",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.744Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 39,
    "publicId" : "dfhjghjkdisudgfds7iy85",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.746Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 40,
    "publicId" : "dfhjghjkdisudgfds7iy86",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:33.748Z",
    "duration" : null,
    "title" : "Title 85"
  },
  {
    "mediaId" : 41,
    "publicId" : "dfhjghjkdisudgfds7iy87",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.758Z"
  },
  {
    "mediaId" : 42,
    "publicId" : "dfhjghjkdisudgfds7iy88",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.762Z"
  },
  {
    "mediaId" : 43,
    "publicId" : "dfhjghjkdisudgfds7iy89",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.766Z"
  },
  {
    "mediaId" : 44,
    "publicId" : "dfhjghjkdisudgfds7iy90",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.769Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 45,
    "publicId" : "dfhjghjkdisudgfds7iy91",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.771Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 46,
    "publicId" : "dfhjghjkdisudgfds7iy92",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:33.775Z",
    "duration" : null,
    "title" : "Title 91"
  }
]
```
