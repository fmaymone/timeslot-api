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

Name : description
Description : Description for the slot

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

Name : likerIds
Description : Array with IDs of Users who like the slot

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
Authorization: Token token=qn1pwgKSZr5x_p11Lgi0pcc3Bzg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/2</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/2&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=qn1pwgKSZr5x_p11Lgi0pcc3Bzg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0b31259fc506c7a03269e82a58a9429f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b9a47de6-3b09-4ba6-b4ae-b9a0fd12cb60
X-Runtime: 0.060345
Content-Length: 1903</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 2,
  "title" : "Slot title 162",
  "description" : "",
  "startDate" : "2019-09-01T18:44:02.000Z",
  "createdAt" : "2016-08-30T09:51:06.737Z",
  "updatedAt" : "2016-08-30T09:51:06.737Z",
  "deletedAt" : null,
  "endDate" : "2019-10-01T18:44:02.000Z",
  "location" : {
    "id" : "0a7ed54c-cd64-411e-b28d-174c6c2a6e6b",
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
    "longitude" : -11.993,
    "placeId" : null
  },
  "creator" : {
    "id" : 5,
    "username" : "User 701",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:06.722Z",
    "updatedAt" : "2016-08-30T09:51:06.722Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 6,
      "publicId" : "dfhjghjkdisudgfds7iy406",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2016-08-30T09:51:06.762Z",
      "duration" : null,
      "title" : "Title 405"
    },
    {
      "mediaId" : 5,
      "publicId" : "dfhjghjkdisudgfds7iy405",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-08-30T09:51:06.760Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 4,
      "publicId" : "dfhjghjkdisudgfds7iy404",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-08-30T09:51:06.758Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 3,
      "publicId" : "dfhjghjkdisudgfds7iy403",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-08-30T09:51:06.752Z"
    },
    {
      "mediaId" : 2,
      "publicId" : "dfhjghjkdisudgfds7iy402",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-08-30T09:51:06.746Z"
    },
    {
      "mediaId" : 1,
      "publicId" : "dfhjghjkdisudgfds7iy401",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-08-30T09:51:06.744Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "likerIds" : [
    7,
    8,
    9
  ],
  "likes" : 3,
  "commentsCounter" : 0,
  "firstGroup" : null,
  "slotGroupUuids" : [],
  "visibleCount" : "all"
}
```
