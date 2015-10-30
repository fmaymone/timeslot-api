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

Name : reslotsCounter
Description : Number of reslots for this slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=4YUHnKyLDxETsdXMCx1YcI0nAP4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=4YUHnKyLDxETsdXMCx1YcI0nAP4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;417be643dbbbbba19eda23f51c2a0607&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: abd24662-d5d9-4e73-9671-e041a7c2b86b
X-Runtime: 0.030606
Vary: Origin
Content-Length: 2604</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 12,
  "title" : "Slot title 28",
  "startDate" : "2019-09-05T07:44:02.000Z",
  "createdAt" : "2015-10-30T15:01:03.498Z",
  "updatedAt" : "2015-10-30T15:01:03.498Z",
  "deletedAt" : null,
  "endDate" : "2019-10-05T07:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 127,
    "username" : "User 176",
    "createdAt" : "2015-10-30T15:01:03.491Z",
    "updatedAt" : "2015-10-30T15:01:03.491Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 52,
      "publicId" : "dfhjghjkdisudgfds7iy55",
      "position" : 12,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:03.564Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 51,
      "publicId" : "dfhjghjkdisudgfds7iy54",
      "position" : 11,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:03.559Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 50,
      "publicId" : "dfhjghjkdisudgfds7iy53",
      "position" : 10,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-30T15:01:03.554Z",
      "duration" : null,
      "title" : "Title 51"
    },
    {
      "mediaId" : 49,
      "publicId" : "dfhjghjkdisudgfds7iy52",
      "position" : 9,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-30T15:01:03.549Z",
      "duration" : null,
      "title" : "Title 50"
    },
    {
      "mediaId" : 48,
      "publicId" : "dfhjghjkdisudgfds7iy51",
      "position" : 8,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.544Z"
    },
    {
      "mediaId" : 47,
      "publicId" : "dfhjghjkdisudgfds7iy50",
      "position" : 7,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.539Z"
    },
    {
      "mediaId" : 46,
      "publicId" : "dfhjghjkdisudgfds7iy49",
      "position" : 6,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.535Z"
    },
    {
      "mediaId" : 45,
      "publicId" : "dfhjghjkdisudgfds7iy48",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-30T15:01:03.513Z",
      "duration" : null,
      "title" : "Title 46"
    },
    {
      "mediaId" : 44,
      "publicId" : "dfhjghjkdisudgfds7iy47",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:03.511Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 43,
      "publicId" : "dfhjghjkdisudgfds7iy46",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:03.508Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 42,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.506Z"
    },
    {
      "mediaId" : 41,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.503Z"
    },
    {
      "mediaId" : 40,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:03.501Z"
    }
  ],
  "settings" : {
    "alerts" : "1110001100"
  },
  "visibility" : "public",
  "reslotsCounter" : 0,
  "likes" : 3,
  "commentsCounter" : 0,
  "shareUrl" : "http://localhost:3100/abcd1234"
}
```
