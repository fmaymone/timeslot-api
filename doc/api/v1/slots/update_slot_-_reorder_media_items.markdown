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
Description : Visibility of the Slot to update (private/friends/public)

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
Authorization: Token token=p0kCjnfpci8h-DttXgcGnwn-1H0
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/5</pre>

#### Body
```javascript
{
  "media" : [
    {
      "mediaId" : 2,
      "mediaType" : "image",
      "position" : 2
    },
    {
      "mediaId" : 3,
      "mediaType" : "image",
      "position" : 0
    },
    {
      "mediaId" : 4,
      "mediaType" : "image",
      "position" : 1
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/5&quot; -d &#39;{&quot;media&quot;:[{&quot;mediaId&quot;:2,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:2},{&quot;mediaId&quot;:3,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:0},{&quot;mediaId&quot;:4,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=p0kCjnfpci8h-DttXgcGnwn-1H0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b8c29134eec204e7aad3aee9c0a6b24d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7b82bc9c-71a7-4216-8aaf-8036bd8b6c20
X-Runtime: 0.059347
Vary: Origin
Content-Length: 952</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 5,
  "title" : "Slot title 37",
  "startDate" : "2019-09-12T14:44:02.000Z",
  "createdAt" : "2015-10-14T11:49:47.200Z",
  "updatedAt" : "2015-10-14T11:49:47.200Z",
  "deletedAt" : null,
  "endDate" : "2019-10-12T14:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 11,
    "username" : "User 222",
    "createdAt" : "2015-10-14T11:49:47.195Z",
    "updatedAt" : "2015-10-14T11:49:47.195Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 4,
      "publicId" : "dfhjghjkdisudgfds7iy47",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:47.218Z"
    },
    {
      "mediaId" : 3,
      "publicId" : "dfhjghjkdisudgfds7iy46",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:47.212Z"
    },
    {
      "mediaId" : 2,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-14T11:49:47.206Z"
    }
  ],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
