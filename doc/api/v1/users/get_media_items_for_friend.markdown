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

<pre>Authorization: Token token=BPPVOEngVFYGR4t-THZrX3pPNqA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/108/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/108/media&quot; -X GET \
	-H &quot;Authorization: Token token=BPPVOEngVFYGR4t-THZrX3pPNqA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;07695cd4c4380f2a758a4898871c5de5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ea745af8-4a40-4390-aab1-f9a5fe46cffb
X-Runtime: 0.030764
Vary: Origin
Content-Length: 3733</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 5,
    "publicId" : "dfhjghjkdisudgfds7iy77",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.578Z"
  },
  {
    "mediaId" : 6,
    "publicId" : "dfhjghjkdisudgfds7iy78",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.581Z"
  },
  {
    "mediaId" : 7,
    "publicId" : "dfhjghjkdisudgfds7iy79",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.583Z"
  },
  {
    "mediaId" : 8,
    "publicId" : "dfhjghjkdisudgfds7iy80",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.586Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 9,
    "publicId" : "dfhjghjkdisudgfds7iy81",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.588Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 10,
    "publicId" : "dfhjghjkdisudgfds7iy82",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.591Z",
    "duration" : null,
    "title" : "Title 81"
  },
  {
    "mediaId" : 11,
    "publicId" : "dfhjghjkdisudgfds7iy83",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.602Z"
  },
  {
    "mediaId" : 12,
    "publicId" : "dfhjghjkdisudgfds7iy84",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.605Z"
  },
  {
    "mediaId" : 13,
    "publicId" : "dfhjghjkdisudgfds7iy85",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.607Z"
  },
  {
    "mediaId" : 14,
    "publicId" : "dfhjghjkdisudgfds7iy86",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.610Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 15,
    "publicId" : "dfhjghjkdisudgfds7iy87",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.612Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 16,
    "publicId" : "dfhjghjkdisudgfds7iy88",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.615Z",
    "duration" : null,
    "title" : "Title 87"
  },
  {
    "mediaId" : 17,
    "publicId" : "dfhjghjkdisudgfds7iy89",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.631Z"
  },
  {
    "mediaId" : 18,
    "publicId" : "dfhjghjkdisudgfds7iy90",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.634Z"
  },
  {
    "mediaId" : 19,
    "publicId" : "dfhjghjkdisudgfds7iy91",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.636Z"
  },
  {
    "mediaId" : 20,
    "publicId" : "dfhjghjkdisudgfds7iy92",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.639Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 21,
    "publicId" : "dfhjghjkdisudgfds7iy93",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.641Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 22,
    "publicId" : "dfhjghjkdisudgfds7iy94",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.644Z",
    "duration" : null,
    "title" : "Title 93"
  },
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy101",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.695Z"
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy102",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.697Z"
  },
  {
    "mediaId" : 31,
    "publicId" : "dfhjghjkdisudgfds7iy103",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.700Z"
  },
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy104",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.702Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy105",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.705Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy106",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.707Z",
    "duration" : null,
    "title" : "Title 105"
  }
]
```
