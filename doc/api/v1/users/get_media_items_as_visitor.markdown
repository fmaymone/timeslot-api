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
ETag: W/&quot;7708738abaa4046b19991a50a131568f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 296c62ef-f30a-43f1-83b3-0ef936a58618
X-Runtime: 0.007965
Vary: Origin
Content-Length: 943</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 113,
    "publicId" : "dfhjghjkdisudgfds7iy185",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.246Z"
  },
  {
    "mediaId" : 114,
    "publicId" : "dfhjghjkdisudgfds7iy186",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.249Z"
  },
  {
    "mediaId" : 115,
    "publicId" : "dfhjghjkdisudgfds7iy187",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.251Z"
  },
  {
    "mediaId" : 116,
    "publicId" : "dfhjghjkdisudgfds7iy188",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:37.254Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 117,
    "publicId" : "dfhjghjkdisudgfds7iy189",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:37.256Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 118,
    "publicId" : "dfhjghjkdisudgfds7iy190",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:37.259Z",
    "duration" : null,
    "title" : "Title 189"
  }
]
```
