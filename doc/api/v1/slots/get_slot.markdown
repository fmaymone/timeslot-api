# Slots API

## Get slot

### GET /v1/slots/:id

if a user is authenticated the slot settings (alerts) will be included

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the slot to get


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : openEnd
Description : OpenEnd Boolean Flag

Name : createdAt
Description : Creation of slot

Name : updatedAt
Description : Last update of slot

Name : deletedAt
Description : Delete date of slot or nil

Name : location
Description : Location data for the slot

Name : creator
Description : User who created the slot

Name : settings
Description : Only included if it&#39;s a slot of the current User (created-/friend-/re-/groupslot),

contains User specific settings for this slot (alerts)

Name : visibility
Description : Visibiltiy of the slot

Name : notes
Description : Notes on the slot

Name : likes
Description : Likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : shareUrl
Description : Share URL for this slot, nil if not yet shared

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=oMqesZXSzby4JNBMruxdZesy0n0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/27</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/27&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oMqesZXSzby4JNBMruxdZesy0n0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b81dc24aebb759596f28615ae312e340&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 979c4912-9f76-414d-a760-5d8f672fc162
X-Runtime: 0.068758
Vary: Origin
Content-Length: 2585</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 27,
  "title" : "Slot title 29",
  "startDate" : "2019-09-03T05:44:02.000Z",
  "createdAt" : "2015-09-14T10:32:43.580Z",
  "updatedAt" : "2015-09-14T10:32:43.580Z",
  "deletedAt" : null,
  "endDate" : "2019-10-03T05:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 199,
    "username" : "User 171",
    "createdAt" : "2015-09-14T10:32:43.569Z",
    "updatedAt" : "2015-09-14T10:32:43.569Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 40,
      "publicId" : "dfhjghjkdisudgfds7iy37",
      "position" : 12,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-14T10:32:43.697Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 39,
      "publicId" : "dfhjghjkdisudgfds7iy36",
      "position" : 11,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-14T10:32:43.689Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 38,
      "publicId" : "dfhjghjkdisudgfds7iy35",
      "position" : 10,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-09-14T10:32:43.683Z",
      "duration" : null,
      "title" : "Title 33"
    },
    {
      "mediaId" : 37,
      "publicId" : "dfhjghjkdisudgfds7iy34",
      "position" : 9,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-09-14T10:32:43.677Z",
      "duration" : null,
      "title" : "Title 32"
    },
    {
      "mediaId" : 36,
      "publicId" : "dfhjghjkdisudgfds7iy33",
      "position" : 8,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:43.672Z"
    },
    {
      "mediaId" : 35,
      "publicId" : "dfhjghjkdisudgfds7iy32",
      "position" : 7,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:43.666Z"
    },
    {
      "mediaId" : 34,
      "publicId" : "dfhjghjkdisudgfds7iy31",
      "position" : 6,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:43.656Z"
    },
    {
      "mediaId" : 33,
      "publicId" : "dfhjghjkdisudgfds7iy30",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-09-14T10:32:43.615Z",
      "duration" : null,
      "title" : "Title 28"
    },
    {
      "mediaId" : 32,
      "publicId" : "dfhjghjkdisudgfds7iy29",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-14T10:32:43.600Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 31,
      "publicId" : "dfhjghjkdisudgfds7iy28",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-14T10:32:43.596Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 30,
      "publicId" : "dfhjghjkdisudgfds7iy27",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:43.593Z"
    },
    {
      "mediaId" : 29,
      "publicId" : "dfhjghjkdisudgfds7iy26",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:43.588Z"
    },
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy25",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:43.584Z"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "visibility" : "public",
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/abcd1234"
}
```
