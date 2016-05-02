# Slots API

## Update Slot - Custom Location Label

### PATCH /v1/stdslot/:id

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : visibility
Description : Visibility of the Slot to update (private/friends/foaf/public)

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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=FWfRuq2r3BVckkXIq4c_9UDLExI
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/46</pre>

#### Body
```javascript
{
  "location" : {
    "name" : "Soho House Custom",
    "latitude" : "52.527335",
    "longitude" : "13.414259"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/stdslot/46&quot; -d &#39;{&quot;location&quot;:{&quot;name&quot;:&quot;Soho House Custom&quot;,&quot;latitude&quot;:&quot;52.527335&quot;,&quot;longitude&quot;:&quot;13.414259&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=FWfRuq2r3BVckkXIq4c_9UDLExI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4eceb1984effa812003a974573ea6d95&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0ea7686e-d1b8-44e9-870e-f71a531bd912
X-Runtime: 0.032857
Content-Length: 864</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 46,
  "title" : "Slot title 129",
  "startDate" : "2019-09-25T12:44:02.000Z",
  "createdAt" : "2016-05-01T22:54:14.106Z",
  "updatedAt" : "2016-05-01T22:54:14.106Z",
  "deletedAt" : null,
  "endDate" : "2019-10-25T12:44:02.000Z",
  "location" : {
    "id" : "6fa37677-c927-4c28-bf45-231d0d2596fa",
    "name" : "Soho House Custom",
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
    "latitude" : 52.527335,
    "longitude" : 13.414259
  },
  "creator" : {
    "id" : 168,
    "username" : "User 478",
    "createdAt" : "2016-05-01T22:54:14.098Z",
    "updatedAt" : "2016-05-01T22:54:14.098Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likerIds" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "visibleCount" : "1"
}
```
