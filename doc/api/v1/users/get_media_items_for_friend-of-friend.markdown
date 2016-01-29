# Users API

## Get media items for Friend-of-Friend

### GET /v1/users/:id/media

Returns an array which includes all media items of the friend which are public- or foaf-visible and if users have shared groups also the media items which the friend has added to this group.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=o9p5rKgCzQ3RaKw-QykaouOkZnI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/144/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/144/media&quot; -X GET \
	-H &quot;Authorization: Token token=o9p5rKgCzQ3RaKw-QykaouOkZnI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0631f418e86d3bf553136987e16a7c85&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9b9cf8ba-b127-4920-90c3-2a42b9645987
X-Runtime: 0.043227
Vary: Origin
Content-Length: 1869</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 29,
    "publicId" : "dfhjghjkdisudgfds7iy95",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.965Z"
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy96",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.968Z"
  },
  {
    "mediaId" : 31,
    "publicId" : "dfhjghjkdisudgfds7iy97",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.971Z"
  },
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy98",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.974Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy99",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:17.977Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy100",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:17.981Z",
    "duration" : null,
    "title" : "Title 99"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy101",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:17.999Z"
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy102",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.005Z"
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy103",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-29T19:39:18.009Z"
  },
  {
    "mediaId" : 38,
    "publicId" : "dfhjghjkdisudgfds7iy104",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:18.014Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 39,
    "publicId" : "dfhjghjkdisudgfds7iy105",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-29T19:39:18.018Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 40,
    "publicId" : "dfhjghjkdisudgfds7iy106",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-29T19:39:18.022Z",
    "duration" : null,
    "title" : "Title 105"
  }
]
```
