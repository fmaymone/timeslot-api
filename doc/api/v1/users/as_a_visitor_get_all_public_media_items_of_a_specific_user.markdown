# Users API

## As a visitor get all public media items of a specific user

### GET /v1/users/:id/media

Returns an array which includes all public media items of the specific user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: 
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/120/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/120/media&quot; -X GET \
	-H &quot;Authorization: &quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;09be076ae0dfa0a10cd885e44232b398&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a717e655-34c1-404b-9f1d-bc97a5967c1d
X-Runtime: 0.009009
Vary: Origin
Content-Length: 930</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy86",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.744Z"
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy87",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.747Z"
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy88",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.749Z"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy89",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:06.752Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy90",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:06.754Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy91",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:06.757Z",
    "duration" : null,
    "title" : "Title 87"
  }
]
```
