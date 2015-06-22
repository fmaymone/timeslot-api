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

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration). Empty for slots with open end

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
Authorization: Token token=zvIRt31tocZ_mC9UjnOT_i3_qhY
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/38</pre>

#### Body
```javascript
{
  "media" : [
    {
      "mediaId" : 32,
      "mediaType" : "image",
      "position" : 2
    },
    {
      "mediaId" : 33,
      "mediaType" : "image",
      "position" : 0
    },
    {
      "mediaId" : 34,
      "mediaType" : "image",
      "position" : 1
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/38&quot; -d &#39;{&quot;media&quot;:[{&quot;mediaId&quot;:32,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:2},{&quot;mediaId&quot;:33,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:0},{&quot;mediaId&quot;:34,&quot;mediaType&quot;:&quot;image&quot;,&quot;position&quot;:1}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=zvIRt31tocZ_mC9UjnOT_i3_qhY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a97464c542ff26f13478d0f65218c477&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7dcc4a25-c771-4eca-a738-bfc2491903e9
X-Runtime: 0.047821
Content-Length: 821</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 38,
  "title" : "Slot title 33",
  "startDate" : "2019-09-07T09:44:02.000Z",
  "createdAt" : "2015-06-22T08:44:20.274Z",
  "updatedAt" : "2015-06-22T08:44:20.274Z",
  "deletedAt" : null,
  "endDate" : "2019-10-07T09:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 173,
    "username" : "User 170",
    "createdAt" : "2015-06-22T08:44:20.270Z",
    "updatedAt" : "2015-06-22T08:44:20.270Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 34,
      "publicId" : "dfhjghjkdisudgfds7iy30",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 33,
      "publicId" : "dfhjghjkdisudgfds7iy29",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 32,
      "publicId" : "dfhjghjkdisudgfds7iy28",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image"
    }
  ],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
