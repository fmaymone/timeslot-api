# Users API

## Get media items for Stranger

### GET /v1/users/:id/media

Returns an array which includes all public media items of a specific user and media items this user has added to common groups.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=izGl42cFCOO2jde4ZJjZRZY7Y_Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/129/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/129/media&quot; -X GET \
	-H &quot;Authorization: Token token=izGl42cFCOO2jde4ZJjZRZY7Y_Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;587b04a3e45dec7552e3521d75fa26a1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fd173730-6375-49e1-9724-e0bc6f5251ce
X-Runtime: 0.022410
Vary: Origin
Content-Length: 1885</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 77,
    "publicId" : "dfhjghjkdisudgfds7iy149",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.039Z"
  },
  {
    "mediaId" : 78,
    "publicId" : "dfhjghjkdisudgfds7iy150",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.041Z"
  },
  {
    "mediaId" : 79,
    "publicId" : "dfhjghjkdisudgfds7iy151",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.043Z"
  },
  {
    "mediaId" : 80,
    "publicId" : "dfhjghjkdisudgfds7iy152",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:37.046Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 81,
    "publicId" : "dfhjghjkdisudgfds7iy153",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:37.048Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 82,
    "publicId" : "dfhjghjkdisudgfds7iy154",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:37.051Z",
    "duration" : null,
    "title" : "Title 153"
  },
  {
    "mediaId" : 101,
    "publicId" : "dfhjghjkdisudgfds7iy173",
    "position" : 24,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.141Z"
  },
  {
    "mediaId" : 102,
    "publicId" : "dfhjghjkdisudgfds7iy174",
    "position" : 25,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.144Z"
  },
  {
    "mediaId" : 103,
    "publicId" : "dfhjghjkdisudgfds7iy175",
    "position" : 26,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-12-23T11:18:37.146Z"
  },
  {
    "mediaId" : 104,
    "publicId" : "dfhjghjkdisudgfds7iy176",
    "position" : 27,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:37.149Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 105,
    "publicId" : "dfhjghjkdisudgfds7iy177",
    "position" : 28,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-12-23T11:18:37.151Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 106,
    "publicId" : "dfhjghjkdisudgfds7iy178",
    "position" : 29,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-12-23T11:18:37.154Z",
    "duration" : null,
    "title" : "Title 177"
  }
]
```
