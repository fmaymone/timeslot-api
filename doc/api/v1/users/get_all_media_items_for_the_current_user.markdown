# Users API

## Get all media items for the current user

### GET /v1/users/:id/media

Returns an array which includes all media items of the current user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=kQO7o4sTjKO0ur5h2e5vTHihEbA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/348/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/348/media&quot; -X GET \
	-H &quot;Authorization: Token token=kQO7o4sTjKO0ur5h2e5vTHihEbA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;61f09a5a3655a1eb1073d831c316c859&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9d2e0bb0-6e8a-4a75-8df5-01e8ef15d955
X-Runtime: 0.019966
Vary: Origin
Content-Length: 1887</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 120,
    "publicId" : "dfhjghjkdisudgfds7iy109",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:03.327Z"
  },
  {
    "mediaId" : 121,
    "publicId" : "dfhjghjkdisudgfds7iy110",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:03.332Z"
  },
  {
    "mediaId" : 122,
    "publicId" : "dfhjghjkdisudgfds7iy111",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:03.335Z"
  },
  {
    "mediaId" : 123,
    "publicId" : "dfhjghjkdisudgfds7iy112",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:03.338Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 124,
    "publicId" : "dfhjghjkdisudgfds7iy113",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:03.341Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 125,
    "publicId" : "dfhjghjkdisudgfds7iy114",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-14T10:33:03.344Z",
    "duration" : null,
    "title" : "Title 110"
  },
  {
    "mediaId" : 126,
    "publicId" : "dfhjghjkdisudgfds7iy115",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:03.359Z"
  },
  {
    "mediaId" : 127,
    "publicId" : "dfhjghjkdisudgfds7iy116",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:03.365Z"
  },
  {
    "mediaId" : 128,
    "publicId" : "dfhjghjkdisudgfds7iy117",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:03.369Z"
  },
  {
    "mediaId" : 129,
    "publicId" : "dfhjghjkdisudgfds7iy118",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:03.371Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 130,
    "publicId" : "dfhjghjkdisudgfds7iy119",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:03.374Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 131,
    "publicId" : "dfhjghjkdisudgfds7iy120",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-14T10:33:03.377Z",
    "duration" : null,
    "title" : "Title 116"
  }
]
```
