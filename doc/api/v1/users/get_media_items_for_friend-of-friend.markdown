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

<pre>Authorization: Token token=x9LENxKae5kc3Kiid1xYZZ8tnSU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/118/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/118/media&quot; -X GET \
	-H &quot;Authorization: Token token=x9LENxKae5kc3Kiid1xYZZ8tnSU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c8412ef2ec211134d092e190351e3b6a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5da5019a-c03a-4022-867a-3166f95cbeff
X-Runtime: 0.026599
Vary: Origin
Content-Length: 2817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 41,
    "publicId" : "dfhjghjkdisudgfds7iy113",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.813Z"
  },
  {
    "mediaId" : 42,
    "publicId" : "dfhjghjkdisudgfds7iy114",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.816Z"
  },
  {
    "mediaId" : 43,
    "publicId" : "dfhjghjkdisudgfds7iy115",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.818Z"
  },
  {
    "mediaId" : 44,
    "publicId" : "dfhjghjkdisudgfds7iy116",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.821Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 45,
    "publicId" : "dfhjghjkdisudgfds7iy117",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.824Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 46,
    "publicId" : "dfhjghjkdisudgfds7iy118",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.826Z",
    "duration" : null,
    "title" : "Title 117"
  },
  {
    "mediaId" : 47,
    "publicId" : "dfhjghjkdisudgfds7iy119",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.836Z"
  },
  {
    "mediaId" : 48,
    "publicId" : "dfhjghjkdisudgfds7iy120",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.839Z"
  },
  {
    "mediaId" : 49,
    "publicId" : "dfhjghjkdisudgfds7iy121",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.843Z"
  },
  {
    "mediaId" : 50,
    "publicId" : "dfhjghjkdisudgfds7iy122",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.845Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 51,
    "publicId" : "dfhjghjkdisudgfds7iy123",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.848Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 52,
    "publicId" : "dfhjghjkdisudgfds7iy124",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.853Z",
    "duration" : null,
    "title" : "Title 123"
  },
  {
    "mediaId" : 65,
    "publicId" : "dfhjghjkdisudgfds7iy137",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.917Z"
  },
  {
    "mediaId" : 66,
    "publicId" : "dfhjghjkdisudgfds7iy138",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.920Z"
  },
  {
    "mediaId" : 67,
    "publicId" : "dfhjghjkdisudgfds7iy139",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:36.923Z"
  },
  {
    "mediaId" : 68,
    "publicId" : "dfhjghjkdisudgfds7iy140",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.925Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 69,
    "publicId" : "dfhjghjkdisudgfds7iy141",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:36.928Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 70,
    "publicId" : "dfhjghjkdisudgfds7iy142",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:36.930Z",
    "duration" : null,
    "title" : "Title 141"
  }
]
```
