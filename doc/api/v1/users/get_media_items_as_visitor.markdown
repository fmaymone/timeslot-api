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

<pre>GET /v1/users/131/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/131/media&quot; -X GET \
	-H &quot;Authorization: &quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;575c182589c46e219b55ada4d7c83b6d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2aa7f032-6c96-4d32-9df3-de0e6183f377
X-Runtime: 0.009261
Content-Length: 938</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 95,
    "publicId" : "dfhjghjkdisudgfds7iy501",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.544Z"
  },
  {
    "mediaId" : 96,
    "publicId" : "dfhjghjkdisudgfds7iy502",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.547Z"
  },
  {
    "mediaId" : 97,
    "publicId" : "dfhjghjkdisudgfds7iy503",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.549Z"
  },
  {
    "mediaId" : 98,
    "publicId" : "dfhjghjkdisudgfds7iy504",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.551Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 99,
    "publicId" : "dfhjghjkdisudgfds7iy505",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.553Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 100,
    "publicId" : "dfhjghjkdisudgfds7iy506",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.555Z",
    "duration" : null,
    "title" : "Title 505"
  }
]
```
