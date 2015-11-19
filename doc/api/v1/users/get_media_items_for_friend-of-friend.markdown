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

<pre>Authorization: Token token=GnlQfhAk5Jihd43JrCj2Q_H3uTA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=GnlQfhAk5Jihd43JrCj2Q_H3uTA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;41b75b4ee9098b74a0f157d6a6368593&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3dc48fb1-a7d2-430c-afe1-992bace97656
X-Runtime: 0.031602
Vary: Origin
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 65,
    "publicId" : "dfhjghjkdisudgfds7iy144",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.534Z"
  },
  {
    "mediaId" : 66,
    "publicId" : "dfhjghjkdisudgfds7iy145",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.537Z"
  },
  {
    "mediaId" : 67,
    "publicId" : "dfhjghjkdisudgfds7iy146",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.539Z"
  },
  {
    "mediaId" : 68,
    "publicId" : "dfhjghjkdisudgfds7iy147",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.542Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 69,
    "publicId" : "dfhjghjkdisudgfds7iy148",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.545Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 70,
    "publicId" : "dfhjghjkdisudgfds7iy149",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.547Z",
    "duration" : null,
    "title" : "Title 147"
  },
  {
    "mediaId" : 71,
    "publicId" : "dfhjghjkdisudgfds7iy150",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.556Z"
  },
  {
    "mediaId" : 72,
    "publicId" : "dfhjghjkdisudgfds7iy151",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.559Z"
  },
  {
    "mediaId" : 73,
    "publicId" : "dfhjghjkdisudgfds7iy152",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.562Z"
  },
  {
    "mediaId" : 74,
    "publicId" : "dfhjghjkdisudgfds7iy153",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.565Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 75,
    "publicId" : "dfhjghjkdisudgfds7iy154",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.568Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 76,
    "publicId" : "dfhjghjkdisudgfds7iy155",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.570Z",
    "duration" : null,
    "title" : "Title 153"
  },
  {
    "mediaId" : 89,
    "publicId" : "dfhjghjkdisudgfds7iy168",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.635Z"
  },
  {
    "mediaId" : 90,
    "publicId" : "dfhjghjkdisudgfds7iy169",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.638Z"
  },
  {
    "mediaId" : 91,
    "publicId" : "dfhjghjkdisudgfds7iy170",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.640Z"
  },
  {
    "mediaId" : 92,
    "publicId" : "dfhjghjkdisudgfds7iy171",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.643Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 93,
    "publicId" : "dfhjghjkdisudgfds7iy172",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.645Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 94,
    "publicId" : "dfhjghjkdisudgfds7iy173",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.648Z",
    "duration" : null,
    "title" : "Title 171"
  }
]
```
