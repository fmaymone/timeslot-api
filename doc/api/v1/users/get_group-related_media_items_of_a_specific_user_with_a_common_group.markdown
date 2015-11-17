# Users API

## Get group-related media items of a specific user with a common group

### GET /v1/users/:id/media

Returns an array which includes all media items of a specific user with a common group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=uWenfJqaSOpKBdWFhpGv7CrFQ9I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/160/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/160/media&quot; -X GET \
	-H &quot;Authorization: Token token=uWenfJqaSOpKBdWFhpGv7CrFQ9I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5e19923c3a045c882d6937ab8df4de34&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d370680e-0d71-454f-8be1-7c1df19551ab
X-Runtime: 0.023513
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 206,
    "publicId" : "dfhjghjkdisudgfds7iy284",
    "position" : 30,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:43.055Z"
  },
  {
    "mediaId" : 207,
    "publicId" : "dfhjghjkdisudgfds7iy285",
    "position" : 31,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:43.057Z"
  },
  {
    "mediaId" : 208,
    "publicId" : "dfhjghjkdisudgfds7iy286",
    "position" : 32,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:43.060Z"
  },
  {
    "mediaId" : 209,
    "publicId" : "dfhjghjkdisudgfds7iy287",
    "position" : 33,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:43.062Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 210,
    "publicId" : "dfhjghjkdisudgfds7iy288",
    "position" : 34,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:43.064Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 211,
    "publicId" : "dfhjghjkdisudgfds7iy289",
    "position" : 35,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:43.067Z",
    "duration" : null,
    "title" : "Title 285"
  },
  {
    "mediaId" : 212,
    "publicId" : "dfhjghjkdisudgfds7iy290",
    "position" : 36,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:43.077Z"
  },
  {
    "mediaId" : 213,
    "publicId" : "dfhjghjkdisudgfds7iy291",
    "position" : 37,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:43.079Z"
  },
  {
    "mediaId" : 214,
    "publicId" : "dfhjghjkdisudgfds7iy292",
    "position" : 38,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-11-17T12:12:43.082Z"
  },
  {
    "mediaId" : 215,
    "publicId" : "dfhjghjkdisudgfds7iy293",
    "position" : 39,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:43.084Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 216,
    "publicId" : "dfhjghjkdisudgfds7iy294",
    "position" : 40,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-11-17T12:12:43.087Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 217,
    "publicId" : "dfhjghjkdisudgfds7iy295",
    "position" : 41,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-11-17T12:12:43.089Z",
    "duration" : null,
    "title" : "Title 291"
  }
]
```
