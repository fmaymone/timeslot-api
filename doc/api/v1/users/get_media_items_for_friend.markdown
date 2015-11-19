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

<pre>Authorization: Token token=5LykEDeF2nvWnJcP5z6mRh_7lIg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/108/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/108/media&quot; -X GET \
	-H &quot;Authorization: Token token=5LykEDeF2nvWnJcP5z6mRh_7lIg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7e97d7c8995b796b66f1edc0d99b55a2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2b98b258-31c8-4299-afb6-b436d78a2e4f
X-Runtime: 0.033297
Vary: Origin
Content-Length: 3759</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy108",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.227Z"
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy109",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.233Z"
  },
  {
    "mediaId" : 31,
    "publicId" : "dfhjghjkdisudgfds7iy110",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.236Z"
  },
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy111",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.238Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy112",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.240Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy113",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.243Z",
    "duration" : null,
    "title" : "Title 111"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy114",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.253Z"
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy115",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.255Z"
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy116",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.258Z"
  },
  {
    "mediaId" : 38,
    "publicId" : "dfhjghjkdisudgfds7iy117",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.260Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 39,
    "publicId" : "dfhjghjkdisudgfds7iy118",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.263Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 40,
    "publicId" : "dfhjghjkdisudgfds7iy119",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.265Z",
    "duration" : null,
    "title" : "Title 117"
  },
  {
    "mediaId" : 41,
    "publicId" : "dfhjghjkdisudgfds7iy120",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.276Z"
  },
  {
    "mediaId" : 42,
    "publicId" : "dfhjghjkdisudgfds7iy121",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.278Z"
  },
  {
    "mediaId" : 43,
    "publicId" : "dfhjghjkdisudgfds7iy122",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.281Z"
  },
  {
    "mediaId" : 44,
    "publicId" : "dfhjghjkdisudgfds7iy123",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.283Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 45,
    "publicId" : "dfhjghjkdisudgfds7iy124",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.285Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 46,
    "publicId" : "dfhjghjkdisudgfds7iy125",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.288Z",
    "duration" : null,
    "title" : "Title 123"
  },
  {
    "mediaId" : 53,
    "publicId" : "dfhjghjkdisudgfds7iy132",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.411Z"
  },
  {
    "mediaId" : 54,
    "publicId" : "dfhjghjkdisudgfds7iy133",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.414Z"
  },
  {
    "mediaId" : 55,
    "publicId" : "dfhjghjkdisudgfds7iy134",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.416Z"
  },
  {
    "mediaId" : 56,
    "publicId" : "dfhjghjkdisudgfds7iy135",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.419Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 57,
    "publicId" : "dfhjghjkdisudgfds7iy136",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.421Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 58,
    "publicId" : "dfhjghjkdisudgfds7iy137",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.424Z",
    "duration" : null,
    "title" : "Title 135"
  }
]
```
