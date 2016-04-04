# Slots API

## Create StandardSlot with IOS Location

### POST /v1/stdslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : visibility *- required -*
Description : Visibility of the Slot (private/friends/foaf/public)

Name : slotSets
Description : Array with UUIDs of the SlotGroups and SlotSets the slot should be added to

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration).

Name : location
Description : Location associated with this slot (see example)

Name : media
Description : Media items (image/audio/video) of to the Slot (see example)

Name : notes
Description : Notes for to the Slot (see example)

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot

Name : name
Description : Name of the location, eg. Timeslot Inc. (255 chars)

Name : thoroughfare
Description : Street address, eg. Dolziger Str. 9 (255 ch.)

Name : subThoroughfare
Description : house number, eg. 9 (255 chars)

Name : locality
Description : city, e.g. Berlin (255 chars)

Name : subLocality
Description : neighborhood, common name, eg. Mitte (255 ch.)

Name : postalCode
Description : zip code, eg. 94114 (32 chars)

Name : country
Description : country, eg. Germany (255 chars)

Name : isoCountryCode
Description : Country Code, eg. US (8 chars)

Name : inLandWater
Description : eg. Lake Tahoe

Name : ocean
Description : eg. Pacific Ocean

Name : areasOfInterest
Description : eg. Volkspark Friedrichshain

Name : latitude
Description : Latitude

Name : longitude
Description : Longitude

Name : privateLocation
Description : private location for this user (true/false) [not yet sure what it will mean technically] -&gt; default: false


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

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=8pGr9HZSdmvcpp5C5hNXZXH27PI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/stdslot</pre>

#### Body
```javascript
{
  "visibility" : "private",
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "notes" : [
    {
      "title" : "revolutionizing the calendar",
      "content" : "this is content"
    },
    {
      "title" : "and another title",
      "content" : "more content here"
    }
  ],
  "settings" : {
    "alerts" : "0101010101"
  },
  "location" : {
    "name" : "Soho House",
    "thoroughfare" : "Torstrasse 1",
    "locality" : "Berlin",
    "country" : "Germany",
    "latitude" : "52.527335",
    "longitude" : "13.414259"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/stdslot&quot; -d &#39;{&quot;visibility&quot;:&quot;private&quot;,&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;location&quot;:{&quot;name&quot;:&quot;Soho House&quot;,&quot;thoroughfare&quot;:&quot;Torstrasse 1&quot;,&quot;locality&quot;:&quot;Berlin&quot;,&quot;country&quot;:&quot;Germany&quot;,&quot;latitude&quot;:&quot;52.527335&quot;,&quot;longitude&quot;:&quot;13.414259&quot;}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=8pGr9HZSdmvcpp5C5hNXZXH27PI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9bb10cd411f9264a79c7800ee454ff88&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 48df7900-ccf6-4883-a014-61fdcb36c540
X-Runtime: 0.051065
Vary: Origin
Content-Length: 1187</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 10,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2016-04-04T20:50:31.577Z",
  "updatedAt" : "2016-04-04T20:50:31.577Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : {
    "id" : "e16429d4-9722-40c8-9de7-bfb66ff85d4c",
    "name" : "Soho House",
    "thoroughfare" : "Torstrasse 1",
    "subThoroughfare" : null,
    "locality" : "Berlin",
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : "Germany",
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 52.527335,
    "longitude" : 13.414259
  },
  "creator" : {
    "id" : 24,
    "username" : "User 326",
    "createdAt" : "2016-04-04T20:50:31.558Z",
    "updatedAt" : "2016-04-04T20:50:31.558Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 1,
    "calendarCount" : 0,
    "friendsCount" : 0
  },
  "notes" : [
    {
      "id" : 10,
      "title" : "and another title",
      "content" : "more content here",
      "localId" : null,
      "createdAt" : "2016-04-04T20:50:31.586Z"
    },
    {
      "id" : 9,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "localId" : null,
      "createdAt" : "2016-04-04T20:50:31.582Z"
    }
  ],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "unauthorizedSlotgroups" : []
}
```
