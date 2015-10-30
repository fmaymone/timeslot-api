# Users API

## Get all media items for the current user

### GET /v1/users/:id/media

Returns an array which includes all media items of the current user.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=hFGRqUZIZagcfT_oDbVSW0XNhAM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/133/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/133/media&quot; -X GET \
	-H &quot;Authorization: Token token=hFGRqUZIZagcfT_oDbVSW0XNhAM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;367c6222f1302674ddae9b8d594d7ce6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: caa33353-3e73-48be-873b-0a0430998943
X-Runtime: 0.009227
Vary: Origin
Content-Length: 1875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 80,
    "publicId" : "dfhjghjkdisudgfds7iy134",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.975Z"
  },
  {
    "mediaId" : 81,
    "publicId" : "dfhjghjkdisudgfds7iy135",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.977Z"
  },
  {
    "mediaId" : 82,
    "publicId" : "dfhjghjkdisudgfds7iy136",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.980Z"
  },
  {
    "mediaId" : 83,
    "publicId" : "dfhjghjkdisudgfds7iy137",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:06.982Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 84,
    "publicId" : "dfhjghjkdisudgfds7iy138",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:06.985Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 85,
    "publicId" : "dfhjghjkdisudgfds7iy139",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:06.987Z",
    "duration" : null,
    "title" : "Title 135"
  },
  {
    "mediaId" : 86,
    "publicId" : "dfhjghjkdisudgfds7iy140",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:06.998Z"
  },
  {
    "mediaId" : 87,
    "publicId" : "dfhjghjkdisudgfds7iy141",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.001Z"
  },
  {
    "mediaId" : 88,
    "publicId" : "dfhjghjkdisudgfds7iy142",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.005Z"
  },
  {
    "mediaId" : 89,
    "publicId" : "dfhjghjkdisudgfds7iy143",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.008Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 90,
    "publicId" : "dfhjghjkdisudgfds7iy144",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.011Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 91,
    "publicId" : "dfhjghjkdisudgfds7iy145",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:07.014Z",
    "duration" : null,
    "title" : "Title 141"
  }
]
```
