# Slots API

## Update Slot - Add Location

### PATCH /v1/stdslot/:id

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : id *- required -*
Description : ID of the slot to update

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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=lJ3ALssbRPv9UE-YaFzg0OKMmGU
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/39</pre>

#### Body
```javascript
{
  "location" : {
    "name" : "Soho House",
    "thoroughfare" : "Torstrasse 1",
    "subThoroughfare" : "1",
    "locality" : "Berlin",
    "subLocality" : "Mitte",
    "postalCode" : "10119",
    "country" : "Germany",
    "isoCountryCode" : "GER",
    "latitude" : "52.527335",
    "longitude" : "13.414259",
    "privateLocation" : true
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/39&quot; -d &#39;{&quot;location&quot;:{&quot;name&quot;:&quot;Soho House&quot;,&quot;thoroughfare&quot;:&quot;Torstrasse 1&quot;,&quot;subThoroughfare&quot;:&quot;1&quot;,&quot;locality&quot;:&quot;Berlin&quot;,&quot;subLocality&quot;:&quot;Mitte&quot;,&quot;postalCode&quot;:&quot;10119&quot;,&quot;country&quot;:&quot;Germany&quot;,&quot;isoCountryCode&quot;:&quot;GER&quot;,&quot;latitude&quot;:&quot;52.527335&quot;,&quot;longitude&quot;:&quot;13.414259&quot;,&quot;privateLocation&quot;:true}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=lJ3ALssbRPv9UE-YaFzg0OKMmGU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e818b29489706f63cae79b710f776411&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b9712b2d-392d-4074-9ad9-0b7608d68221
X-Runtime: 0.047359
Content-Length: 899</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 39,
  "title" : "Slot title 34",
  "startDate" : "2019-09-08T10:44:02.000Z",
  "endDate" : "2019-10-08T10:44:02.000Z",
  "createdAt" : "2015-07-02T12:34:19.500Z",
  "updatedAt" : "2015-07-02T12:34:19.500Z",
  "deletedAt" : null,
  "openEnd" : false,
  "location" : {
    "id" : 3,
    "name" : "Soho House",
    "thoroughfare" : "Torstrasse 1",
    "subThoroughfare" : "1",
    "locality" : "Berlin",
    "subLocality" : "Mitte",
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : "10119",
    "country" : "Germany",
    "isoCountryCode" : "GER",
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 52.527335,
    "longitude" : 13.414259,
    "privateLocation" : true
  },
  "creator" : {
    "id" : 187,
    "username" : "User 172",
    "createdAt" : "2015-07-02T12:34:19.494Z",
    "updatedAt" : "2015-07-02T12:34:19.494Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
