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

<pre>Authorization: Token token=g5m-k6eYkPkJMh13yymzB7NWA1Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/126/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/126/media&quot; -X GET \
	-H &quot;Authorization: Token token=g5m-k6eYkPkJMh13yymzB7NWA1Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8fc66ef06314145601f6c9d48c81ff15&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3f8b200f-4ce5-4060-a483-fbef7b6f5284
X-Runtime: 0.023587
Vary: Origin
Content-Length: 2796</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 11,
    "publicId" : "dfhjghjkdisudgfds7iy57",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.583Z"
  },
  {
    "mediaId" : 12,
    "publicId" : "dfhjghjkdisudgfds7iy58",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.585Z"
  },
  {
    "mediaId" : 13,
    "publicId" : "dfhjghjkdisudgfds7iy59",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.588Z"
  },
  {
    "mediaId" : 14,
    "publicId" : "dfhjghjkdisudgfds7iy60",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.590Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 15,
    "publicId" : "dfhjghjkdisudgfds7iy61",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.592Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 16,
    "publicId" : "dfhjghjkdisudgfds7iy62",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:33.594Z",
    "duration" : null,
    "title" : "Title 61"
  },
  {
    "mediaId" : 17,
    "publicId" : "dfhjghjkdisudgfds7iy63",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.605Z"
  },
  {
    "mediaId" : 18,
    "publicId" : "dfhjghjkdisudgfds7iy64",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.607Z"
  },
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy65",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.610Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy66",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.613Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy67",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.616Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy68",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:33.621Z",
    "duration" : null,
    "title" : "Title 67"
  },
  {
    "mediaId" : 23,
    "publicId" : "dfhjghjkdisudgfds7iy69",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.634Z"
  },
  {
    "mediaId" : 24,
    "publicId" : "dfhjghjkdisudgfds7iy70",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.636Z"
  },
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy71",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.639Z"
  },
  {
    "mediaId" : 26,
    "publicId" : "dfhjghjkdisudgfds7iy72",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.641Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 27,
    "publicId" : "dfhjghjkdisudgfds7iy73",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.643Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 28,
    "publicId" : "dfhjghjkdisudgfds7iy74",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:33.645Z",
    "duration" : null,
    "title" : "Title 73"
  }
]
```
