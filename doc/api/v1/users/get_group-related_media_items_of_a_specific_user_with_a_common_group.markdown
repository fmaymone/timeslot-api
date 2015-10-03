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

<pre>Authorization: Token token=lHoUaWO5C5wiVNO0ao7Ivzu9HiQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/402/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/402/media&quot; -X GET \
	-H &quot;Authorization: Token token=lHoUaWO5C5wiVNO0ao7Ivzu9HiQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bdd0ebd04a41cb62dbbc01d22693a215&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e9cd141f-4502-4e55-9159-64f47d5e678c
X-Runtime: 0.019508
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 294,
    "publicId" : "dfhjghjkdisudgfds7iy283",
    "position" : 30,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-03T22:30:46.763Z"
  },
  {
    "mediaId" : 295,
    "publicId" : "dfhjghjkdisudgfds7iy284",
    "position" : 31,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-03T22:30:46.766Z"
  },
  {
    "mediaId" : 296,
    "publicId" : "dfhjghjkdisudgfds7iy285",
    "position" : 32,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-03T22:30:46.769Z"
  },
  {
    "mediaId" : 297,
    "publicId" : "dfhjghjkdisudgfds7iy286",
    "position" : 33,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-03T22:30:46.771Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 298,
    "publicId" : "dfhjghjkdisudgfds7iy287",
    "position" : 34,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-03T22:30:46.774Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 299,
    "publicId" : "dfhjghjkdisudgfds7iy288",
    "position" : 35,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-03T22:30:46.776Z",
    "duration" : null,
    "title" : "Title 284"
  },
  {
    "mediaId" : 300,
    "publicId" : "dfhjghjkdisudgfds7iy289",
    "position" : 36,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-03T22:30:46.786Z"
  },
  {
    "mediaId" : 301,
    "publicId" : "dfhjghjkdisudgfds7iy290",
    "position" : 37,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-03T22:30:46.789Z"
  },
  {
    "mediaId" : 302,
    "publicId" : "dfhjghjkdisudgfds7iy291",
    "position" : 38,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-03T22:30:46.792Z"
  },
  {
    "mediaId" : 303,
    "publicId" : "dfhjghjkdisudgfds7iy292",
    "position" : 39,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-03T22:30:46.794Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 304,
    "publicId" : "dfhjghjkdisudgfds7iy293",
    "position" : 40,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-03T22:30:46.797Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 305,
    "publicId" : "dfhjghjkdisudgfds7iy294",
    "position" : 41,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-03T22:30:46.800Z",
    "duration" : null,
    "title" : "Title 290"
  }
]
```
