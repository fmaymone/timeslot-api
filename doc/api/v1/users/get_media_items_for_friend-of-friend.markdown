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

<pre>Authorization: Token token=IDmDtrDh5REXCLJlsh2PQCvRsdE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=IDmDtrDh5REXCLJlsh2PQCvRsdE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;203e7af2cb2f32a8fa2d89f5fbb8a517&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 43f91cf8-6d79-47ec-b411-c32319090a9e
X-Runtime: 0.024017
Content-Length: 1875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 47,
    "publicId" : "dfhjghjkdisudgfds7iy453",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.218Z"
  },
  {
    "mediaId" : 48,
    "publicId" : "dfhjghjkdisudgfds7iy454",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.221Z"
  },
  {
    "mediaId" : 49,
    "publicId" : "dfhjghjkdisudgfds7iy455",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.224Z"
  },
  {
    "mediaId" : 50,
    "publicId" : "dfhjghjkdisudgfds7iy456",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.227Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 51,
    "publicId" : "dfhjghjkdisudgfds7iy457",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.229Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 52,
    "publicId" : "dfhjghjkdisudgfds7iy458",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.234Z",
    "duration" : null,
    "title" : "Title 457"
  },
  {
    "mediaId" : 53,
    "publicId" : "dfhjghjkdisudgfds7iy459",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.253Z"
  },
  {
    "mediaId" : 54,
    "publicId" : "dfhjghjkdisudgfds7iy460",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.255Z"
  },
  {
    "mediaId" : 55,
    "publicId" : "dfhjghjkdisudgfds7iy461",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.257Z"
  },
  {
    "mediaId" : 56,
    "publicId" : "dfhjghjkdisudgfds7iy462",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.259Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 57,
    "publicId" : "dfhjghjkdisudgfds7iy463",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.261Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 58,
    "publicId" : "dfhjghjkdisudgfds7iy464",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.264Z",
    "duration" : null,
    "title" : "Title 463"
  }
]
```
