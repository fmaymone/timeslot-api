# Slots API

## Update Slot - Reorder media items

### PATCH /v1/slots/:id

An array with the media_item keys and corresponding position/ordering number (starting from 0) for all images of the slot must be send.

returns 404 if a mediaId doesn&#39;t exist

returns 422 if position params are invalid

returns 200 and slot details on success

### Parameters

Name : id *- required -*
Description : ID of the slot to update

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

Name : media *- required -*
Description : Array with mediaIds and position parameter

Name : mediaId *- required -*
Description : Timeslot&#39;s internal ID for this media item

Name : position *- required -*
Description : Sorting order of the image/video/audio. If not supplied the media items will be sortet as they are ordered in the array.


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

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=ujz3XNBHxHssF8oCfIAxE6a4OZE
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/slots/14</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/slots/14&quot; -d &#39;{&quot;media&quot;:[{&quot;mediaId&quot;:8,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:2},{&quot;mediaId&quot;:9,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:0},{&quot;mediaId&quot;:10,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=ujz3XNBHxHssF8oCfIAxE6a4OZE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1d750993efeb3ad4b2264e33529b72c6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e912dd34-e683-48fe-9ea6-75698f9b2cf3
X-Runtime: 0.118455
Content-Length: 1055</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
