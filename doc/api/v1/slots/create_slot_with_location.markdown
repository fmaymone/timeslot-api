# Slots API

## Create Slot with Location

### POST /v1/slots

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
Description : Enddate and Time of the Slot (startdate + duration).

Name : rrule
Description : Repeating Rule for the Slot.

Name : allday
Description : The All-Day boolean Flag indicates that a Slot lasts for one or more complete days (default: false).

Name : description
Description : Description for the slot (max. 500 characters)

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

Name : visibility
Description : Deprecated: Visibility of the Slot (private/friends/foaf/public)

Name : slotGroups
Description : Array with UUIDs of the SlotGroups slot should be added to

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

Name : placeId
Description : Google Place ID

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

Name : rrule
Description : Repeating Rule for the slot

Name : allday
Description : All-Day Boolean Flag

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

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=Gr-O_6E83jjc_QNQuZKrsskTnUc
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;rrule&quot;:&quot;RRULE:FREQ=WEEKLY;BYDAY=TH&quot;,&quot;description&quot;:&quot;One day it will all make sense.&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;,&quot;slotGroups&quot;:[&quot;f61122a5-13d8-42fd-b203-65de451799bb&quot;,&quot;f2ff9cd8-b5ca-46cf-981f-2181d6121935&quot;,&quot;7e15b9d0-ad93-41e6-93d5-69b66e87860a&quot;,&quot;dcae179a-2bbd-45ee-b3c5-7fd2a9ca421d&quot;,&quot;3f967890-173b-429d-9d75-19207343632a&quot;],&quot;location&quot;:{&quot;name&quot;:&quot;Soho House&quot;,&quot;thoroughfare&quot;:&quot;Torstrasse 1&quot;,&quot;locality&quot;:&quot;Berlin&quot;,&quot;country&quot;:&quot;Germany&quot;,&quot;latitude&quot;:&quot;52.527335&quot;,&quot;longitude&quot;:&quot;13.414259&quot;}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Gr-O_6E83jjc_QNQuZKrsskTnUc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c8e99e561f7d6b468796d04f8d36c976&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0deb1702-9dfc-4ae3-8cd7-8a7d8190f5ed
X-Runtime: 0.501081
Content-Length: 2077</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
