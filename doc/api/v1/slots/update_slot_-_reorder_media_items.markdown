# Slots API

## Update Slot - Reorder media items

### PATCH /v1/stdslot/:id

An array with the media_item keys and corresponding position/ordering number (starting from 0) for all images of the slot must be send.

returns 404 if a mediaId doesn&#39;t exist

returns 422 if position params are invalid

returns 200 and slot details on success

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
Authorization: Token token=2WoWyO11SGreMQpa58VE2yqPBvw
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/44</pre>

#### Body
```javascript
{
  "media" : [
    {
      "mediaId" : 27,
      "mediaType" : "image",
      "position" : 2
    },
    {
      "mediaId" : 28,
      "mediaType" : "image",
      "position" : 0
    },
    {
      "mediaId" : 29,
      "mediaType" : "image",
      "position" : 1
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/stdslot/44&quot; -d &#39;{&quot;media&quot;:[{&quot;mediaId&quot;:27,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:2},{&quot;mediaId&quot;:28,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:0},{&quot;mediaId&quot;:29,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=2WoWyO11SGreMQpa58VE2yqPBvw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;440d0032b076f374c3817313f7092266&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0d51ec29-5fda-4c86-bf2d-211d958ebe18
X-Runtime: 0.029964
Content-Length: 923</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 44,
  "title" : "Slot title 127",
  "startDate" : "2019-09-23T10:44:02.000Z",
  "createdAt" : "2016-05-01T22:54:13.979Z",
  "updatedAt" : "2016-05-01T22:54:13.979Z",
  "deletedAt" : null,
  "endDate" : "2019-10-23T10:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 161,
    "username" : "User 471",
    "createdAt" : "2016-05-01T22:54:13.970Z",
    "updatedAt" : "2016-05-01T22:54:13.970Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 29,
      "publicId" : "dfhjghjkdisudgfds7iy56",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:14.002Z"
    },
    {
      "mediaId" : 28,
      "publicId" : "dfhjghjkdisudgfds7iy55",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:13.997Z"
    },
    {
      "mediaId" : 27,
      "publicId" : "dfhjghjkdisudgfds7iy54",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-05-01T22:54:13.986Z"
    }
  ],
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
