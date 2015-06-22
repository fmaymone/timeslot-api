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
Authorization: Token token=ILxxo9oCjMwpdJTy2cfGcZ10Gj8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/25</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/25&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ILxxo9oCjMwpdJTy2cfGcZ10Gj8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aa7e550e2287688dfbaf0eb8a9bfe8e9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 55e6409e-eb9b-4776-aa7c-006fe0c49db8
X-Runtime: 0.038396
Content-Length: 1665</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 25,
  "title" : "Slot title 27",
  "startDate" : "2019-09-01T03:44:02.000Z",
  "createdAt" : "2015-06-22T08:44:18.394Z",
  "updatedAt" : "2015-06-22T08:44:18.394Z",
  "deletedAt" : null,
  "endDate" : "2019-10-01T03:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 147,
    "username" : "User 144",
    "createdAt" : "2015-06-22T08:44:18.386Z",
    "updatedAt" : "2015-06-22T08:44:18.386Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 30,
      "publicId" : "dfhjghjkdisudgfds7iy27",
      "position" : 9,
      "localId" : null,
      "mediaType" : "video",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 29,
      "publicId" : "dfhjghjkdisudgfds7iy26",
      "position" : 8,
      "localId" : null,
      "mediaType" : "video",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy25",
      "position" : 7,
      "localId" : null,
      "mediaType" : "audio",
      "duration" : null,
      "title" : null
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy24",
      "position" : 6,
      "localId" : null,
      "mediaType" : "audio",
      "duration" : null,
      "title" : null
    },
    {
      "mediaId" : 26,
      "publicId" : "dfhjghjkdisudgfds7iy23",
      "position" : 5,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 25,
      "publicId" : "dfhjghjkdisudgfds7iy22",
      "position" : 4,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 24,
      "publicId" : "dfhjghjkdisudgfds7iy21",
      "position" : 3,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 23,
      "publicId" : "dfhjghjkdisudgfds7iy20",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 22,
      "publicId" : "dfhjghjkdisudgfds7iy19",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 21,
      "publicId" : "dfhjghjkdisudgfds7iy18",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image"
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
