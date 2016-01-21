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
Description : Visibiltiy of the slot (private/friend/foaf/public)

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

Name : reslotsCounter
Description : Number of reslots for this slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=CYfP2xBL6R1bVnCm38Y2f_yFxR0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/28</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/28&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CYfP2xBL6R1bVnCm38Y2f_yFxR0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f56ff4b120a4e4c10b344e8be4ac4db8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c2bd3023-23aa-4f90-af5e-75f0a938bbfc
X-Runtime: 0.013651
Vary: Origin
Content-Length: 1466</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 28,
  "title" : "Slot title 55",
  "startDate" : "2019-09-05T10:44:02.000Z",
  "createdAt" : "2016-01-21T23:11:39.702Z",
  "updatedAt" : "2016-01-21T23:11:39.702Z",
  "deletedAt" : null,
  "endDate" : "2019-10-05T10:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 178,
    "username" : "User 248",
    "createdAt" : "2016-01-21T23:11:39.695Z",
    "updatedAt" : "2016-01-21T23:11:39.695Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 25,
      "publicId" : "dfhjghjkdisudgfds7iy53",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2016-01-21T23:11:39.716Z",
      "duration" : null,
      "title" : "Title 52"
    },
    {
      "mediaId" : 24,
      "publicId" : "dfhjghjkdisudgfds7iy52",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-01-21T23:11:39.714Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 23,
      "publicId" : "dfhjghjkdisudgfds7iy51",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-01-21T23:11:39.712Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 22,
      "publicId" : "dfhjghjkdisudgfds7iy50",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:39.709Z"
    },
    {
      "mediaId" : 21,
      "publicId" : "dfhjghjkdisudgfds7iy49",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:39.707Z"
    },
    {
      "mediaId" : 20,
      "publicId" : "dfhjghjkdisudgfds7iy48",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-01-21T23:11:39.705Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 0,
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/abcd1234"
}
```
