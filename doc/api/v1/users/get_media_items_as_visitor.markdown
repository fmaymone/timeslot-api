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

<pre>GET /v1/users/145/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/145/media&quot; -X GET \
	-H &quot;Authorization: &quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3b2dbbd30b9ab41d5251f22120dd43db&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6f1bf0db-596e-4525-8811-f4d825e3b693
X-Runtime: 0.009040
Vary: Origin
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 83,
    "publicId" : "dfhjghjkdisudgfds7iy129",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:34.015Z"
  },
  {
    "mediaId" : 84,
    "publicId" : "dfhjghjkdisudgfds7iy130",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:34.018Z"
  },
  {
    "mediaId" : 85,
    "publicId" : "dfhjghjkdisudgfds7iy131",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-04-04T20:50:34.020Z"
  },
  {
    "mediaId" : 86,
    "publicId" : "dfhjghjkdisudgfds7iy132",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:34.022Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 87,
    "publicId" : "dfhjghjkdisudgfds7iy133",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-04-04T20:50:34.024Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 88,
    "publicId" : "dfhjghjkdisudgfds7iy134",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-04-04T20:50:34.027Z",
    "duration" : null,
    "title" : "Title 133"
  }
]
```
