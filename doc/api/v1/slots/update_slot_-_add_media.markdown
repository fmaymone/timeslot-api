# Slots API

## Update Slot - Add media

### PATCH /v1/stdslot/:id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary client updates the slot with the image information.

returns 422 if the media data is invalid

returns 200 and slot details including the new mediaID

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

Name : media
Description : array of new media items

Name : mediaType *- required -*
Description : one of image/video/audio

Name : publicId *- required -*
Description : Cloudinary ID / URL

Name : localId
Description : iOS local ID (max 512 chars)

Name : position
Description : Sorting order of the new media item. If not submitted it will be added at the end

Name : duration
Description : only for video and audio items

Name : thumbnail
Description : public URL for video thumbnail


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

Name : publicId
Description : Cloudinary URL of the media item

Name : position
Description : Sorting order position of the media item

Name : localId
Description : Ios specific local identifier

Name : duration
Description : Duration of audio/video file

Name : title
Description : Title of audio file

Name : thumbnail
Description : Clouinary public URL of the video thumbnail

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=oaSXB7S1iPfgdLDw-nAvX6hf554
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/4</pre>

#### Body
```javascript
{
  "media" : [
    {
      "publicId" : "v1234567/dfhjghjkdisudgfds7sly.jpg",
      "position" : "1",
      "mediaType" : "image",
      "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/4&quot; -d &#39;{&quot;media&quot;:[{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7sly.jpg&quot;,&quot;position&quot;:&quot;1&quot;,&quot;mediaType&quot;:&quot;image&quot;,&quot;localId&quot;:&quot;B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=oaSXB7S1iPfgdLDw-nAvX6hf554&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;70c9d2160c48b6e771b37d5a598a176b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7c05f4e6-e27a-49bb-a036-f4cfab4a3217
X-Runtime: 0.028059
Vary: Origin
Content-Length: 730</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 4,
  "title" : "Slot title 36",
  "startDate" : "2019-09-14T16:44:02.000Z",
  "createdAt" : "2015-10-30T15:01:04.472Z",
  "updatedAt" : "2015-10-30T15:01:04.472Z",
  "deletedAt" : null,
  "endDate" : "2019-10-14T16:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 9,
    "username" : "User 227",
    "createdAt" : "2015-10-30T15:01:04.468Z",
    "updatedAt" : "2015-10-30T15:01:04.468Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 1,
      "publicId" : "v1234567/dfhjghjkdisudgfds7sly.jpg",
      "position" : 1,
      "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001",
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:04.483Z"
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
