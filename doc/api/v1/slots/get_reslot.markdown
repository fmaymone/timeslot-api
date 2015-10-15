# Slots API

## Get Reslot

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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=YlTCqaNLHwoIhH4HIpee3AruZ_o
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/11</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/11&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=YlTCqaNLHwoIhH4HIpee3AruZ_o&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1d0db9b87f65500784be53350e8b6476&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5bb79223-99bb-4229-b4e1-313d1e5558df
X-Runtime: 0.048705
Vary: Origin
Content-Length: 1679</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 11,
  "title" : "Timeslot",
  "startDate" : "2019-09-03T05:44:02.000Z",
  "createdAt" : "2015-10-14T11:49:44.488Z",
  "updatedAt" : "2015-10-14T11:49:44.488Z",
  "deletedAt" : null,
  "endDate" : "2019-10-03T05:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 130,
    "username" : "User 182",
    "createdAt" : "2015-10-14T11:49:44.464Z",
    "updatedAt" : "2015-10-14T11:49:44.464Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 41,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 6,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-14T11:49:44.633Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 40,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 5,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-14T11:49:44.621Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 39,
      "publicId" : "dfhjghjkdisudgfds7iy42",
      "position" : 4,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-14T11:49:44.606Z",
      "duration" : null,
      "title" : "Title 40"
    },
    {
      "mediaId" : 38,
      "publicId" : "dfhjghjkdisudgfds7iy41",
      "position" : 3,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-14T11:49:44.600Z",
      "duration" : null,
      "title" : "Title 39"
    },
    {
      "mediaId" : 37,
      "publicId" : "dfhjghjkdisudgfds7iy40",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.594Z"
    },
    {
      "mediaId" : 36,
      "publicId" : "dfhjghjkdisudgfds7iy39",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.588Z"
    },
    {
      "mediaId" : 35,
      "publicId" : "dfhjghjkdisudgfds7iy38",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:44.583Z"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 134
  },
  "parent" : {
    "id" : 10
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
