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
Authorization: Token token=_WQ034nXltuEwoIs6dJRbLLOeJs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/2</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/2&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_WQ034nXltuEwoIs6dJRbLLOeJs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b6d62eaba0850184971cd69eebd94666&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d32b25c4-5135-4591-b3d0-0c64152ab596
X-Runtime: 0.024043
Vary: Origin
Content-Length: 1734</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 2,
  "title" : "Slot title 71",
  "startDate" : "2019-09-21T02:44:02.000Z",
  "createdAt" : "2016-04-04T20:50:31.157Z",
  "updatedAt" : "2016-04-04T20:50:31.157Z",
  "deletedAt" : null,
  "endDate" : "2019-10-21T02:44:02.000Z",
  "location" : {
    "id" : "4065f530-5f35-44bf-8d93-64e2855ebadf",
    "name" : "Acapulco",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : null,
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : null,
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.234,
    "longitude" : -11.993
  },
  "creator" : {
    "id" : 5,
    "username" : "User 300",
    "createdAt" : "2016-04-04T20:50:31.134Z",
    "updatedAt" : "2016-04-04T20:50:31.134Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 6,
      "publicId" : "dfhjghjkdisudgfds7iy46",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2016-04-04T20:50:31.186Z",
      "duration" : null,
      "title" : "Title 45"
    },
    {
      "mediaId" : 5,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-04-04T20:50:31.183Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 4,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-04-04T20:50:31.178Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 3,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-04-04T20:50:31.171Z"
    },
    {
      "mediaId" : 2,
      "publicId" : "dfhjghjkdisudgfds7iy42",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-04-04T20:50:31.167Z"
    },
    {
      "mediaId" : 1,
      "publicId" : "dfhjghjkdisudgfds7iy41",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-04-04T20:50:31.162Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "likes" : 3,
  "commentsCounter" : 0
}
```
