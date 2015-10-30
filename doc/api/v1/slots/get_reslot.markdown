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
Authorization: Token token=F1ztdM8t1HHX4juh14Wqf-HwNL4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/14</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/14&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=F1ztdM8t1HHX4juh14Wqf-HwNL4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9f5d72710d821bf595282f993e13ca13&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 69312002-3198-445c-bff4-7d3414aef6d8
X-Runtime: 0.025714
Vary: Origin
Content-Length: 1679</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 14,
  "title" : "Timeslot",
  "startDate" : "2019-09-06T08:44:02.000Z",
  "createdAt" : "2015-10-30T15:01:03.641Z",
  "updatedAt" : "2015-10-30T15:01:03.641Z",
  "deletedAt" : null,
  "endDate" : "2019-10-06T08:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 140,
    "username" : "User 189",
    "createdAt" : "2015-10-30T15:01:03.620Z",
    "updatedAt" : "2015-10-30T15:01:03.620Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 59,
      "publicId" : "dfhjghjkdisudgfds7iy62",
      "position" : 6,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:03.686Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 58,
      "publicId" : "dfhjghjkdisudgfds7iy61",
      "position" : 5,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:03.681Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 57,
      "publicId" : "dfhjghjkdisudgfds7iy60",
      "position" : 4,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-30T15:01:03.676Z",
      "duration" : null,
      "title" : "Title 58"
    },
    {
      "mediaId" : 56,
      "publicId" : "dfhjghjkdisudgfds7iy59",
      "position" : 3,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-30T15:01:03.671Z",
      "duration" : null,
      "title" : "Title 57"
    },
    {
      "mediaId" : 55,
      "publicId" : "dfhjghjkdisudgfds7iy58",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.666Z"
    },
    {
      "mediaId" : 54,
      "publicId" : "dfhjghjkdisudgfds7iy57",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.661Z"
    },
    {
      "mediaId" : 53,
      "publicId" : "dfhjghjkdisudgfds7iy56",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.656Z"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 144
  },
  "parent" : {
    "id" : 13
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
