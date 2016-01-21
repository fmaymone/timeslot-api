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

<pre>Authorization: Token token=Fn9Xtyv_7ymdCsxvB8My1pPAswM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/128/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/128/media&quot; -X GET \
	-H &quot;Authorization: Token token=Fn9Xtyv_7ymdCsxvB8My1pPAswM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;158003ff3c1a060c7e0eb3e90d214fa9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: de5a2888-1c23-4ec6-8a83-a65febdb70a2
X-Runtime: 0.023593
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
    "createdAt" : "2016-01-21T23:11:42.932Z"
  },
  {
    "mediaId" : 30,
    "publicId" : "dfhjghjkdisudgfds7iy96",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.934Z"
  },
  {
    "mediaId" : 31,
    "publicId" : "dfhjghjkdisudgfds7iy97",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.936Z"
  },
  {
    "mediaId" : 32,
    "publicId" : "dfhjghjkdisudgfds7iy98",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.939Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 33,
    "publicId" : "dfhjghjkdisudgfds7iy99",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.941Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 34,
    "publicId" : "dfhjghjkdisudgfds7iy100",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-21T23:11:42.943Z",
    "duration" : null,
    "title" : "Title 99"
  },
  {
    "mediaId" : 35,
    "publicId" : "dfhjghjkdisudgfds7iy101",
    "position" : 6,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.954Z"
  },
  {
    "mediaId" : 36,
    "publicId" : "dfhjghjkdisudgfds7iy102",
    "position" : 7,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.957Z"
  },
  {
    "mediaId" : 37,
    "publicId" : "dfhjghjkdisudgfds7iy103",
    "position" : 8,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-01-21T23:11:42.959Z"
  },
  {
    "mediaId" : 38,
    "publicId" : "dfhjghjkdisudgfds7iy104",
    "position" : 9,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.965Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 39,
    "publicId" : "dfhjghjkdisudgfds7iy105",
    "position" : 10,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-01-21T23:11:42.971Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 40,
    "publicId" : "dfhjghjkdisudgfds7iy106",
    "position" : 11,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-01-21T23:11:42.973Z",
    "duration" : null,
    "title" : "Title 105"
  }
]
```
