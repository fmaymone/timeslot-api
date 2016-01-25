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
Authorization: Token token=_LMyJ9UEh3StL0s7kRSMbFIReP4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/33</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/slots/33&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_LMyJ9UEh3StL0s7kRSMbFIReP4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;464bf550c224066998415c15b25c3b8b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1ffc3268-bbbc-40c4-aa16-eb94a2244965
X-Runtime: 0.012788
Vary: Origin
Content-Length: 1466</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 33,
  "title" : "Slot title 54",
  "startDate" : "2019-09-04T09:44:02.000Z",
  "createdAt" : "2015-12-23T11:18:33.571Z",
  "updatedAt" : "2015-12-23T11:18:33.571Z",
  "deletedAt" : null,
  "endDate" : "2019-10-04T09:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 180,
    "username" : "User 240",
    "createdAt" : "2015-12-23T11:18:33.564Z",
    "updatedAt" : "2015-12-23T11:18:33.564Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 31,
      "publicId" : "dfhjghjkdisudgfds7iy59",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-12-23T11:18:33.586Z",
      "duration" : null,
      "title" : "Title 58"
    },
    {
      "mediaId" : 30,
      "publicId" : "dfhjghjkdisudgfds7iy58",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-12-23T11:18:33.584Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 29,
      "publicId" : "dfhjghjkdisudgfds7iy57",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-12-23T11:18:33.581Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy56",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:33.579Z"
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy55",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:33.576Z"
    },
    {
      "mediaId" : 26,
      "publicId" : "dfhjghjkdisudgfds7iy54",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-12-23T11:18:33.574Z"
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
