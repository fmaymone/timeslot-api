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

<pre>GET /v1/users/139/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/139/media&quot; -X GET \
	-H &quot;Authorization: &quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5cf9a902a23c7d11ebfbff8f60768042&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a2dc4049-5bec-48b2-abee-92cae05597f4
X-Runtime: 0.007437
Vary: Origin
Content-Length: 943</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 137,
    "publicId" : "dfhjghjkdisudgfds7iy215",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.941Z"
  },
  {
    "mediaId" : 138,
    "publicId" : "dfhjghjkdisudgfds7iy216",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.943Z"
  },
  {
    "mediaId" : 139,
    "publicId" : "dfhjghjkdisudgfds7iy217",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-04T16:56:54.945Z"
  },
  {
    "mediaId" : 140,
    "publicId" : "dfhjghjkdisudgfds7iy218",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.948Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 141,
    "publicId" : "dfhjghjkdisudgfds7iy219",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-04T16:56:54.950Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 142,
    "publicId" : "dfhjghjkdisudgfds7iy220",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-04T16:56:54.953Z",
    "duration" : null,
    "title" : "Title 219"
  }
]
```
