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

<pre>Authorization: Token token=6wr5zPA2LmoP9DGMZgWohrdzfoQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/151/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/151/media&quot; -X GET \
	-H &quot;Authorization: Token token=6wr5zPA2LmoP9DGMZgWohrdzfoQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2f7ca2ad6af78dc24e632575dee0073d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95000d03-2d53-4402-8684-ce96a8ed3783
X-Runtime: 0.029243
Vary: Origin
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 53,
    "publicId" : "dfhjghjkdisudgfds7iy119",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.204Z"
  },
  {
    "mediaId" : 54,
    "publicId" : "dfhjghjkdisudgfds7iy120",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.208Z"
  },
  {
    "mediaId" : 55,
    "publicId" : "dfhjghjkdisudgfds7iy121",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.211Z"
  },
  {
    "mediaId" : 56,
    "publicId" : "dfhjghjkdisudgfds7iy122",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:18.214Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 57,
    "publicId" : "dfhjghjkdisudgfds7iy123",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:18.218Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 58,
    "publicId" : "dfhjghjkdisudgfds7iy124",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:18.221Z",
    "duration" : null,
    "title" : "Title 123"
  }
]
```
