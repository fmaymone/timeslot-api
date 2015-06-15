# Slots API

## Create StandardSlot with IOS Location

### POST /v1/stdslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration)

Name : locationId
Description : ID of the location associated with this slot

Name : notes
Description : Notes for to the Slot

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot

Name : location
Description : IOS location associated with this slot

Name : name
Description : Name of the IOS location, e.g. Timeslot Inc. (255 chars)

Name : thoroughfare
Description : Street address, Dolziger Str. 9 (255 chars)

Name : subThoroughfare
Description : house number, e.g. 9 (255 chars)

Name : locality
Description : city, e.g. Berlin (255 chars)

Name : subLocality
Description : neighborhood, common name, e.g. Mitte (255 chars)

Name : postalCode
Description : zip code, e.g. 94114 (32 chars)

Name : country
Description : country, e.g. Germany (255 chars)

Name : isoCountryCode
Description : Country Code, e.g. US (8 chars)

Name : inLandWater
Description : e.g. Lake Tahoe

Name : ocean
Description : e.g. Pacific Ocean

Name : areasOfInterest
Description : e.g. Volkspark Friedrichshain

Name : latitude
Description : Latitude

Name : longitude
Description : Longitude

Name : privateLocation
Description : private location for this user (true/false) [not yet sure what it will mean technically] -&gt; default: false

Name : visibility *- required -*
Description : Visibility of the Slot


### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

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

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=9dFFa23_KxeYiY3OOy_xuNKRuto
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/stdslot</pre>

#### Body
```javascript
{
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
  },
  "visibility" : "private"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;location&quot;:{&quot;name&quot;:&quot;Soho House&quot;,&quot;thoroughfare&quot;:&quot;Torstrasse 1&quot;,&quot;locality&quot;:&quot;Berlin&quot;,&quot;country&quot;:&quot;Germany&quot;,&quot;latitude&quot;:&quot;52.527335&quot;,&quot;longitude&quot;:&quot;13.414259&quot;},&quot;visibility&quot;:&quot;private&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=9dFFa23_KxeYiY3OOy_xuNKRuto&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9045c253bdfe65f6201ddcde3dc39cd9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 50a999d1-d211-478d-841c-6a166ed67971
X-Runtime: 0.066056
Content-Length: 1133</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 29,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2015-06-15T11:19:14.158Z",
  "updatedAt" : "2015-06-15T11:19:14.158Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : {
    "id" : 2,
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
    "longitude" : 13.414259,
    "privateLocation" : false
  },
  "creator" : {
    "id" : 156,
    "username" : "User 153",
    "createdAt" : "2015-06-15T11:19:14.133Z",
    "updatedAt" : "2015-06-15T11:19:14.133Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [
    {
      "id" : 8,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "createdAt" : "2015-06-15T11:19:14.161Z"
    },
    {
      "id" : 9,
      "title" : "and another title",
      "content" : "more content here",
      "createdAt" : "2015-06-15T11:19:14.164Z"
    }
  ],
  "photos" : [],
  "voices" : [],
  "videos" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0101010101"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
