# Users API

## Get all friend-visible media items of a user

### GET /v1/users/:id/media

Returns an array which includes all media items of this user which are public or friend-visible.

### Parameters

Name : id *- required -*
Description : ID of the User to get the MediaItems for


### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=7W83QskV0HayM51hpqMGdDVuyNE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/159/media</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/159/media&quot; -X GET \
	-H &quot;Authorization: Token token=7W83QskV0HayM51hpqMGdDVuyNE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;54aad28950237465ca1cc5f61c3c5351&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c7df4457-420c-4f79-aa66-5b498b4791c5
X-Runtime: 0.027438
Vary: Origin
Content-Length: 1897</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "mediaId" : 188,
    "publicId" : "dfhjghjkdisudgfds7iy242",
    "position" : 12,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.509Z"
  },
  {
    "mediaId" : 189,
    "publicId" : "dfhjghjkdisudgfds7iy243",
    "position" : 13,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.512Z"
  },
  {
    "mediaId" : 190,
    "publicId" : "dfhjghjkdisudgfds7iy244",
    "position" : 14,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.514Z"
  },
  {
    "mediaId" : 191,
    "publicId" : "dfhjghjkdisudgfds7iy245",
    "position" : 15,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.516Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 192,
    "publicId" : "dfhjghjkdisudgfds7iy246",
    "position" : 16,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.519Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 193,
    "publicId" : "dfhjghjkdisudgfds7iy247",
    "position" : 17,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:07.521Z",
    "duration" : null,
    "title" : "Title 243"
  },
  {
    "mediaId" : 194,
    "publicId" : "dfhjghjkdisudgfds7iy248",
    "position" : 18,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.531Z"
  },
  {
    "mediaId" : 195,
    "publicId" : "dfhjghjkdisudgfds7iy249",
    "position" : 19,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.533Z"
  },
  {
    "mediaId" : 196,
    "publicId" : "dfhjghjkdisudgfds7iy250",
    "position" : 20,
    "localId" : null,
    "mediaType" : "image",
    "createdAt" : "2015-10-30T15:01:07.535Z"
  },
  {
    "mediaId" : 197,
    "publicId" : "dfhjghjkdisudgfds7iy251",
    "position" : 21,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.538Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 198,
    "publicId" : "dfhjghjkdisudgfds7iy252",
    "position" : 22,
    "localId" : null,
    "mediaType" : "video",
    "createdAt" : "2015-10-30T15:01:07.540Z",
    "duration" : null,
    "thumbnail" : null
  },
  {
    "mediaId" : 199,
    "publicId" : "dfhjghjkdisudgfds7iy253",
    "position" : 23,
    "localId" : null,
    "mediaType" : "audio",
    "createdAt" : "2015-10-30T15:01:07.543Z",
    "duration" : null,
    "title" : "Title 249"
  }
]
```
