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

Name : rrule
Description : Repeating Rule for the slot

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
Authorization: Token token=naRSm6DfImJ1GQtbMjTvudv2C8k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/slots/5</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/5&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=naRSm6DfImJ1GQtbMjTvudv2C8k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1ecbfb7d4b26579f1778b91b7fee1e8d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6b1c2eea-bc7d-4315-833c-b226789bac7c
X-Runtime: 0.037920
Content-Length: 1918</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 5,
  "title" : "Slot title 168",
  "description" : "",
  "startDate" : "2019-09-07T00:44:02.000Z",
  "rrule" : "",
  "createdAt" : "2016-12-11T19:54:36.219Z",
  "updatedAt" : "2016-12-11T19:54:36.219Z",
  "deletedAt" : null,
  "endDate" : "2019-10-07T00:44:02.000Z",
  "location" : {
    "id" : "04427511-a9cd-4176-bcc3-f36f016ce9bc",
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
    "id" : 13,
    "username" : "User 717",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-12-11T19:54:36.200Z",
    "updatedAt" : "2016-12-11T19:54:36.200Z",
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
      "createdAt" : "2016-12-11T19:54:36.240Z",
      "duration" : null,
      "title" : "Title 405"
    },
    {
      "mediaId" : 5,
      "publicId" : "dfhjghjkdisudgfds7iy405",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-12-11T19:54:36.236Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 4,
      "publicId" : "dfhjghjkdisudgfds7iy404",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2016-12-11T19:54:36.233Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 3,
      "publicId" : "dfhjghjkdisudgfds7iy403",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-12-11T19:54:36.230Z"
    },
    {
      "mediaId" : 2,
      "publicId" : "dfhjghjkdisudgfds7iy402",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-12-11T19:54:36.228Z"
    },
    {
      "mediaId" : 1,
      "publicId" : "dfhjghjkdisudgfds7iy401",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-12-11T19:54:36.225Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "likerIds" : [
    15,
    16,
    17
  ],
  "likes" : 3,
  "commentsCounter" : 0,
  "firstGroup" : null,
  "slotGroupUuids" : [],
  "visibleCount" : "all"
}
```
