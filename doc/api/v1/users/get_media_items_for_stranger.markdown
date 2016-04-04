# Users API

## Get media items for Stranger

### GET /v1/users/:id/media

Returns an array which includes all public media items of a specific user and media items this user has added to common groups.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=D7HWJ6Iv9sirL9SXR4gNZgDvlsQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/139/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/139/media&quot; -X GET \
	-H &quot;Authorization: Token token=D7HWJ6Iv9sirL9SXR4gNZgDvlsQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;883ebd19d660ffc1fc2435a3ed328ab3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 41d59b92-6cbd-472e-9c3b-61d4a30fc4cc
X-Runtime: 0.016298
Vary: Origin
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 59,
    "publicId" : "dfhjghjkdisudgfds7iy105",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.886Z"
  },
  {
    "mediaId" : 60,
    "publicId" : "dfhjghjkdisudgfds7iy106",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.888Z"
  },
  {
    "mediaId" : 61,
    "publicId" : "dfhjghjkdisudgfds7iy107",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:33.890Z"
  },
  {
    "mediaId" : 62,
    "publicId" : "dfhjghjkdisudgfds7iy108",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.893Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 63,
    "publicId" : "dfhjghjkdisudgfds7iy109",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:33.896Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 64,
    "publicId" : "dfhjghjkdisudgfds7iy110",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:33.898Z",
    "duration" : null,
    "title" : "Title 109"
  }
]
```
