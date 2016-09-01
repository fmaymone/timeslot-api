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

<pre>Authorization: Token token=-8zu72EFDN5fsGSDxiBAF9idvyw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/112/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/112/media&quot; -X GET \
	-H &quot;Authorization: Token token=-8zu72EFDN5fsGSDxiBAF9idvyw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;50fdb0e8730cadf0aa8c72d95214f540&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b3b7bb02-a9f8-4ce5-99ae-7ed8a405cbb1
X-Runtime: 0.023847
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 23,
    "publicId" : "dfhjghjkdisudgfds7iy429",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.059Z"
  },
  {
    "mediaId" : 24,
    "publicId" : "dfhjghjkdisudgfds7iy430",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.062Z"
  },
  {
    "mediaId" : 25,
    "publicId" : "dfhjghjkdisudgfds7iy431",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.064Z"
  },
  {
    "mediaId" : 26,
    "publicId" : "dfhjghjkdisudgfds7iy432",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.067Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 27,
    "publicId" : "dfhjghjkdisudgfds7iy433",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.070Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 28,
    "publicId" : "dfhjghjkdisudgfds7iy434",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.072Z",
    "duration" : null,
    "title" : "Title 433"
  },
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy435",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.088Z"
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy436",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.090Z"
  },
  {
    "mediaId" : 31,
    "publicId" : "dfhjghjkdisudgfds7iy437",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.098Z"
  },
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy438",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.101Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy439",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.103Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy440",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.105Z",
    "duration" : null,
    "title" : "Title 439"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy441",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.118Z"
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy442",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.121Z"
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy443",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.123Z"
  },
  {
    "mediaId" : 38,
    "publicId" : "dfhjghjkdisudgfds7iy444",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.126Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 39,
    "publicId" : "dfhjghjkdisudgfds7iy445",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.128Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 40,
    "publicId" : "dfhjghjkdisudgfds7iy446",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.130Z",
    "duration" : null,
    "title" : "Title 445"
  }
]
```
