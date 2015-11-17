# Users API

## Get all friend-visible media items of a user

### GET /v1/users/:id/media

Returns an array which includes all media items of this user which are public or friend-visible.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=Suk4Kr_7gQxld7WsRLVoZJrsJS0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/146/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/146/media&quot; -X GET \
	-H &quot;Authorization: Token token=Suk4Kr_7gQxld7WsRLVoZJrsJS0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c63f8b77eba88ed156b165815c16554f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9a01062d-7497-4077-a9eb-18b5524e209d
X-Runtime: 0.023434
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 140,
    "publicId" : "dfhjghjkdisudgfds7iy218",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.722Z"
  },
  {
    "mediaId" : 141,
    "publicId" : "dfhjghjkdisudgfds7iy219",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.724Z"
  },
  {
    "mediaId" : 142,
    "publicId" : "dfhjghjkdisudgfds7iy220",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.727Z"
  },
  {
    "mediaId" : 143,
    "publicId" : "dfhjghjkdisudgfds7iy221",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.730Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 144,
    "publicId" : "dfhjghjkdisudgfds7iy222",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.732Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 145,
    "publicId" : "dfhjghjkdisudgfds7iy223",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:42.735Z",
    "duration" : null,
    "title" : "Title 219"
  },
  {
    "mediaId" : 146,
    "publicId" : "dfhjghjkdisudgfds7iy224",
    "position" : 18,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.744Z"
  },
  {
    "mediaId" : 147,
    "publicId" : "dfhjghjkdisudgfds7iy225",
    "position" : 19,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.747Z"
  },
  {
    "mediaId" : 148,
    "publicId" : "dfhjghjkdisudgfds7iy226",
    "position" : 20,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.749Z"
  },
  {
    "mediaId" : 149,
    "publicId" : "dfhjghjkdisudgfds7iy227",
    "position" : 21,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.751Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 150,
    "publicId" : "dfhjghjkdisudgfds7iy228",
    "position" : 22,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.754Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 151,
    "publicId" : "dfhjghjkdisudgfds7iy229",
    "position" : 23,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:42.756Z",
    "duration" : null,
    "title" : "Title 225"
  }
]
```
