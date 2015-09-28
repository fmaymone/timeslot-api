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

<pre>Authorization: Token token=z9T7uZClBphR7Sto2ZCnxhNuOww
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/374/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/374/media&quot; -X GET \
	-H &quot;Authorization: Token token=z9T7uZClBphR7Sto2ZCnxhNuOww&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9530d656195d6b3de10604d98d7ad9f7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95c2cfa1-cdab-45e7-bfeb-6bd41e9577fc
X-Runtime: 0.019988
Vary: Origin
Content-Length: 943</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 168,
    "publicId" : "dfhjghjkdisudgfds7iy157",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:04.006Z"
  },
  {
    "mediaId" : 169,
    "publicId" : "dfhjghjkdisudgfds7iy158",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:04.008Z"
  },
  {
    "mediaId" : 170,
    "publicId" : "dfhjghjkdisudgfds7iy159",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-09-28T10:16:04.013Z"
  },
  {
    "mediaId" : 171,
    "publicId" : "dfhjghjkdisudgfds7iy160",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:04.020Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 172,
    "publicId" : "dfhjghjkdisudgfds7iy161",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-09-28T10:16:04.022Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 173,
    "publicId" : "dfhjghjkdisudgfds7iy162",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-09-28T10:16:04.025Z",
    "duration" : null,
    "title" : "Title 158"
  }
]
```
