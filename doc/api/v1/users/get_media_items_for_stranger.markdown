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

<pre>Authorization: Token token=SIqh5ONDy3S63vS2pVOrBPMFHA4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/125/media</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/125/media&quot; -X GET \
	-H &quot;Authorization: Token token=SIqh5ONDy3S63vS2pVOrBPMFHA4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;a3e3f89ddac7215dee659b5f8c2bd1bf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2afb9185-bd71-4f02-b865-f016339e6ec1
X-Runtime: 0.017873
Content-Length: 937</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 71,
    "publicId" : "dfhjghjkdisudgfds7iy477",
    "position" : 0,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.379Z"
  },
  {
    "mediaId" : 72,
    "publicId" : "dfhjghjkdisudgfds7iy478",
    "position" : 1,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.383Z"
  },
  {
    "mediaId" : 73,
    "publicId" : "dfhjghjkdisudgfds7iy479",
    "position" : 2,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2016-08-30T09:51:11.390Z"
  },
  {
    "mediaId" : 74,
    "publicId" : "dfhjghjkdisudgfds7iy480",
    "position" : 3,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.395Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 75,
    "publicId" : "dfhjghjkdisudgfds7iy481",
    "position" : 4,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2016-08-30T09:51:11.397Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 76,
    "publicId" : "dfhjghjkdisudgfds7iy482",
    "position" : 5,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2016-08-30T09:51:11.399Z",
    "duration" : null,
    "title" : "Title 481"
  }
]
```
