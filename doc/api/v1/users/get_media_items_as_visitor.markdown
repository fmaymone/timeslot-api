# Users API

## Get media items as Visitor

### GET /v1/users/:id/media

Visitor means there is no current user.

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

<pre>GET /v1/users/157/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/157/media&quot; -X GET \
	-H &quot;Authorization: &quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0bc397f6e22724cd73459cc6e6120598&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fabf7062-a2fa-4756-bb45-53a773eb9cc5
X-Runtime: 0.020622
Vary: Origin
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 77,
    "publicId" : "dfhjghjkdisudgfds7iy143",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.396Z"
  },
  {
    "mediaId" : 78,
    "publicId" : "dfhjghjkdisudgfds7iy144",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.399Z"
  },
  {
    "mediaId" : 79,
    "publicId" : "dfhjghjkdisudgfds7iy145",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.403Z"
  },
  {
    "mediaId" : 80,
    "publicId" : "dfhjghjkdisudgfds7iy146",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:18.406Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 81,
    "publicId" : "dfhjghjkdisudgfds7iy147",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:18.409Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 82,
    "publicId" : "dfhjghjkdisudgfds7iy148",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:18.412Z",
    "duration" : null,
    "title" : "Title 147"
  }
]
```
