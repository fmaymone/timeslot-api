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

<pre>GET /v1/users/119/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/119/media&quot; -X GET \
	-H &quot;Authorization: &quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2ae2f64cc0f150413c6a071867e19b09&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 14a66ea6-8ee9-4aca-b28a-d7a69ee9c6bf
X-Runtime: 0.012170
Vary: Origin
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy110",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.149Z"
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy111",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.152Z"
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy112",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:42.154Z"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy113",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.157Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy114",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:42.159Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy115",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:42.161Z",
    "duration" : null,
    "title" : "Title 111"
  }
]
```
