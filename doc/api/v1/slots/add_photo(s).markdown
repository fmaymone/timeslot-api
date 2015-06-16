# Slots API

## Add photo(s)

### PATCH /v1/stdslot/:id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary client updates the slot with the image information.

returns 422 if the media data is invalid

returns 200 and slot details including the new mediaID

### Parameters

Name : id *- required -*
Description : ID of the slot to update

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

Name : media
Description : array of new media items

Name : mediaType *- required -*
Description : one of photo/video/voice

Name : publicId *- required -*
Description : Cloudinary ID / URL

Name : localId
Description : iOS local ID

Name : position
Description : Sorting order of the new media item. If not submitted it will be added at the end

Name : localId
Description : IOS specific local identifier for media item

Name : duration
Description : only for video and voice items

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

Name : clyid
Description : Cloudinary URL of the media item

Name : position
Description : Sorting order position of the media item

Name : localId
Description : Ios specific local identifier

Name : duration
Description : Duration of audio/video file

Name : thumbnail
Description : Clouinary public URL of the video thumbnail

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=4xALTi-Nj1KaiwRX2yHVRdbd_IM
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/37</pre>

#### Body
```javascript
{
  "media" : [
    {
      "publicId" : "v1234567/dfhjghjkdisudgfds7sly.jpg",
      "position" : "1",
      "mediaType" : "photo",
      "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/37&quot; -d &#39;{&quot;media&quot;:[{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7sly.jpg&quot;,&quot;position&quot;:&quot;1&quot;,&quot;mediaType&quot;:&quot;photo&quot;,&quot;localId&quot;:&quot;B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=4xALTi-Nj1KaiwRX2yHVRdbd_IM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0f36d4b7a4da613978ddb7aa6f250c99&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ba83f94b-d3ff-42a1-b6d6-f2fde0bf6271
X-Runtime: 0.039202
Content-Length: 670</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 37,
  "title" : "Slot title 32",
  "startDate" : "2019-09-06T08:44:02.000Z",
  "createdAt" : "2015-06-16T15:49:55.184Z",
  "updatedAt" : "2015-06-16T15:49:55.184Z",
  "deletedAt" : null,
  "endDate" : "2019-10-06T08:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 171,
    "username" : "User 168",
    "createdAt" : "2015-06-16T15:49:55.179Z",
    "updatedAt" : "2015-06-16T15:49:55.179Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 31,
      "clyid" : "v1234567/dfhjghjkdisudgfds7sly.jpg",
      "position" : 1,
      "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001",
      "mediaType" : "photo"
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
