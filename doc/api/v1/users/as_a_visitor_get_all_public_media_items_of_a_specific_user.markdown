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

<pre>GET /v1/users/349/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/349/media&quot; -X GET \
	-H &quot;Authorization: &quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;db325314d3de3bfd8e0a62259e3c5e81&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 961f4533-314c-4194-980d-be11bc3e6b65
X-Runtime: 0.015555
Vary: Origin
Content-Length: 930</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 72,
    "publicId" : "dfhjghjkdisudgfds7iy61",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:03.302Z"
  },
  {
    "mediaId" : 73,
    "publicId" : "dfhjghjkdisudgfds7iy62",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:03.305Z"
  },
  {
    "mediaId" : 74,
    "publicId" : "dfhjghjkdisudgfds7iy63",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:03.308Z"
  },
  {
    "mediaId" : 75,
    "publicId" : "dfhjghjkdisudgfds7iy64",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:03.313Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 76,
    "publicId" : "dfhjghjkdisudgfds7iy65",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:03.319Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 77,
    "publicId" : "dfhjghjkdisudgfds7iy66",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-28T10:16:03.322Z",
    "duration" : null,
    "title" : "Title 62"
  }
]
```
