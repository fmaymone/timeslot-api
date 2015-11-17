# Users API

## Get media items of an user

### GET /v1/users/:id/media

Returns an array which includes all public media items of a specific user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=0LOP6TkIpPY0I9qjE381yJMDMIo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/132/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/132/media&quot; -X GET \
	-H &quot;Authorization: Token token=0LOP6TkIpPY0I9qjE381yJMDMIo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;08e48bc39167dbe5e0b616f4f0d75054&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 619d0f94-ba51-4866-9c59-94d43ff5074f
X-Runtime: 0.024456
Vary: Origin
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 80,
    "publicId" : "dfhjghjkdisudgfds7iy158",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.422Z"
  },
  {
    "mediaId" : 81,
    "publicId" : "dfhjghjkdisudgfds7iy159",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.425Z"
  },
  {
    "mediaId" : 82,
    "publicId" : "dfhjghjkdisudgfds7iy160",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.427Z"
  },
  {
    "mediaId" : 83,
    "publicId" : "dfhjghjkdisudgfds7iy161",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.430Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 84,
    "publicId" : "dfhjghjkdisudgfds7iy162",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.432Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 85,
    "publicId" : "dfhjghjkdisudgfds7iy163",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:42.435Z",
    "duration" : null,
    "title" : "Title 159"
  }
]
```
