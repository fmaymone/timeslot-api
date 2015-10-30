# Users API

## Get media items of an user

### GET /v1/users/:id/media

Returns an array which includes all public media items of a specific user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=OpwrTRbIQpeDmhKV6n_UQkOgdOI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/145/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/145/media&quot; -X GET \
	-H &quot;Authorization: Token token=OpwrTRbIQpeDmhKV6n_UQkOgdOI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;869c1a588a3c91cc5619b38b5d31ac39&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f16527af-1a31-4077-b7f3-81f3fe03ebfa
X-Runtime: 0.013547
Vary: Origin
Content-Length: 943</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 128,
    "publicId" : "dfhjghjkdisudgfds7iy182",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.229Z"
  },
  {
    "mediaId" : 129,
    "publicId" : "dfhjghjkdisudgfds7iy183",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.231Z"
  },
  {
    "mediaId" : 130,
    "publicId" : "dfhjghjkdisudgfds7iy184",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.234Z"
  },
  {
    "mediaId" : 131,
    "publicId" : "dfhjghjkdisudgfds7iy185",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.236Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 132,
    "publicId" : "dfhjghjkdisudgfds7iy186",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.238Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 133,
    "publicId" : "dfhjghjkdisudgfds7iy187",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:07.241Z",
    "duration" : null,
    "title" : "Title 183"
  }
]
```
