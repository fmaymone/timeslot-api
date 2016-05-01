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
Authorization: Token token=w6_kY6cj0N9Qf1Mts2cV2mIDdkU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/30</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/30&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=w6_kY6cj0N9Qf1Mts2cV2mIDdkU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3c81c0419449e8c13c7aedfd7271b76f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 798c94c9-769f-43c6-8c3f-b62d927de05d
X-Runtime: 0.016358
Content-Length: 1790</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 30,
  "title" : "Slot title 117",
  "startDate" : "2019-09-13T00:44:02.000Z",
  "createdAt" : "2016-05-01T22:54:13.231Z",
  "updatedAt" : "2016-05-01T22:54:13.231Z",
  "deletedAt" : null,
  "endDate" : "2019-10-13T00:44:02.000Z",
  "location" : {
    "id" : "e449dbe3-558a-4978-9e2c-4534c9e66a30",
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
    "id" : 130,
    "username" : "User 430",
    "createdAt" : "2016-05-01T22:54:13.218Z",
    "updatedAt" : "2016-05-01T22:54:13.218Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 25,
      "publicId" : "dfhjghjkdisudgfds7iy46",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2016-05-01T22:54:13.247Z",
      "duration" : null,
      "title" : "Title 45"
    },
    {
      "mediaId" : 24,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-05-01T22:54:13.244Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 23,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-05-01T22:54:13.241Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 22,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:13.239Z"
    },
    {
      "mediaId" : 21,
      "publicId" : "dfhjghjkdisudgfds7iy42",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:13.237Z"
    },
    {
      "mediaId" : 20,
      "publicId" : "dfhjghjkdisudgfds7iy41",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:13.235Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "likerIds" : [
    133,
    134,
    135
  ],
  "likes" : 3,
  "commentsCounter" : 0,
  "visibleCount" : "all"
}
```
