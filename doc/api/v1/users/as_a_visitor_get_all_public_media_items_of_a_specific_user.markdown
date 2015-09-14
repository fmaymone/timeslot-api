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

<pre>GET /v1/users/335/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/335/media&quot; -X GET \
	-H &quot;Authorization: &quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;47775f818d52e48b7b197a1506be6dff&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 136ef6e5-14db-434a-a67a-c208b8490a38
X-Runtime: 0.022419
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
    "createdAt" : "2015-09-14T10:33:02.971Z"
  },
  {
    "mediaId" : 73,
    "publicId" : "dfhjghjkdisudgfds7iy62",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:02.975Z"
  },
  {
    "mediaId" : 74,
    "publicId" : "dfhjghjkdisudgfds7iy63",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-14T10:33:02.978Z"
  },
  {
    "mediaId" : 75,
    "publicId" : "dfhjghjkdisudgfds7iy64",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:02.981Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 76,
    "publicId" : "dfhjghjkdisudgfds7iy65",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-14T10:33:02.985Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 77,
    "publicId" : "dfhjghjkdisudgfds7iy66",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-14T10:33:02.988Z",
    "duration" : null,
    "title" : "Title 62"
  }
]
```
