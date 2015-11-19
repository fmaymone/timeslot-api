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
ETag: W/&quot;db4c7d82a3c2bf8e37c10844de52509b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 96e53e02-c32f-4561-be54-c6be0804d2d3
X-Runtime: 0.007431
Vary: Origin
Content-Length: 943</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 137,
    "publicId" : "dfhjghjkdisudgfds7iy216",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.983Z"
  },
  {
    "mediaId" : 138,
    "publicId" : "dfhjghjkdisudgfds7iy217",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.986Z"
  },
  {
    "mediaId" : 139,
    "publicId" : "dfhjghjkdisudgfds7iy218",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T23:46:17.988Z"
  },
  {
    "mediaId" : 140,
    "publicId" : "dfhjghjkdisudgfds7iy219",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.991Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 141,
    "publicId" : "dfhjghjkdisudgfds7iy220",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T23:46:17.993Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 142,
    "publicId" : "dfhjghjkdisudgfds7iy221",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T23:46:17.995Z",
    "duration" : null,
    "title" : "Title 219"
  }
]
```
