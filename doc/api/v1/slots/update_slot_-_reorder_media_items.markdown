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
Authorization: Token token=pnZQBm6QIbzfBn7SKDl0gkiL_nI
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/slots/13</pre>

#### Body
```javascript
{
  "media" : [
    {
      "mediaId" : 8,
      "mediaType" : "image",
      "position" : 2
    },
    {
      "mediaId" : 9,
      "mediaType" : "image",
      "position" : 0
    },
    {
      "mediaId" : 10,
      "mediaType" : "image",
      "position" : 1
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/13&quot; -d &#39;{&quot;media&quot;:[{&quot;mediaId&quot;:8,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:2},{&quot;mediaId&quot;:9,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:0},{&quot;mediaId&quot;:10,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=pnZQBm6QIbzfBn7SKDl0gkiL_nI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7565017355dc2c54fe38797911d2d528&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1a25bba4-c37b-4015-9e95-7c100539e490
X-Runtime: 0.106001
Content-Length: 1040</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 13,
  "title" : "Slot title 176",
  "description" : "",
  "startDate" : "2019-09-15T08:44:02.000Z",
  "rrule" : "",
  "createdAt" : "2016-12-11T19:54:36.975Z",
  "updatedAt" : "2016-12-11T19:54:36.975Z",
  "deletedAt" : null,
  "endDate" : "2019-10-15T08:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 30,
    "username" : "User 744",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-12-11T19:54:36.965Z",
    "updatedAt" : "2016-12-11T19:54:36.965Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 10,
      "publicId" : "dfhjghjkdisudgfds7iy416",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-12-11T19:54:37.003Z"
    },
    {
      "mediaId" : 9,
      "publicId" : "dfhjghjkdisudgfds7iy415",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-12-11T19:54:36.997Z"
    },
    {
      "mediaId" : 8,
      "publicId" : "dfhjghjkdisudgfds7iy414",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2016-12-11T19:54:36.988Z"
    }
  ],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likerIds" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "firstGroup" : null,
  "slotGroupUuids" : [],
  "visibleCount" : "1"
}
```
