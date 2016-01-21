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

<pre>Authorization: Token token=VHm94FrGHPPaJHnjNOpWmeudMZI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/122/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/122/media&quot; -X GET \
	-H &quot;Authorization: Token token=VHm94FrGHPPaJHnjNOpWmeudMZI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;845fe5411ad668d6d1dcd52f4772497b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 09200ce6-0966-4f5a-871e-86f7df896148
X-Runtime: 0.023232
Vary: Origin
Content-Length: 2791</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 5,
    "publicId" : "dfhjghjkdisudgfds7iy71",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.790Z"
  },
  {
    "mediaId" : 6,
    "publicId" : "dfhjghjkdisudgfds7iy72",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.792Z"
  },
  {
    "mediaId" : 7,
    "publicId" : "dfhjghjkdisudgfds7iy73",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.794Z"
  },
  {
    "mediaId" : 8,
    "publicId" : "dfhjghjkdisudgfds7iy74",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.797Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 9,
    "publicId" : "dfhjghjkdisudgfds7iy75",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.799Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 10,
    "publicId" : "dfhjghjkdisudgfds7iy76",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-21T23:11:42.801Z",
    "duration" : null,
    "title" : "Title 75"
  },
  {
    "mediaId" : 11,
    "publicId" : "dfhjghjkdisudgfds7iy77",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.810Z"
  },
  {
    "mediaId" : 12,
    "publicId" : "dfhjghjkdisudgfds7iy78",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.812Z"
  },
  {
    "mediaId" : 13,
    "publicId" : "dfhjghjkdisudgfds7iy79",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.815Z"
  },
  {
    "mediaId" : 14,
    "publicId" : "dfhjghjkdisudgfds7iy80",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.817Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 15,
    "publicId" : "dfhjghjkdisudgfds7iy81",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.821Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 16,
    "publicId" : "dfhjghjkdisudgfds7iy82",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-21T23:11:42.824Z",
    "duration" : null,
    "title" : "Title 81"
  },
  {
    "mediaId" : 17,
    "publicId" : "dfhjghjkdisudgfds7iy83",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.839Z"
  },
  {
    "mediaId" : 18,
    "publicId" : "dfhjghjkdisudgfds7iy84",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.841Z"
  },
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy85",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.843Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy86",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.846Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy87",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.848Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy88",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-21T23:11:42.850Z",
    "duration" : null,
    "title" : "Title 87"
  }
]
```
