# Slots API

## Add photo(s)

### PATCH /v1/stdslot/:id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary client updates the slot with the image information.

returns 422 if the media data is invalid

returns 200 and slot details including the new mediaID

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : photos
Description : array of new photos

Name : voices
Description : array of new audio recordings

Name : videos
Description : array of new videos

Name : publicId *- required -*
Description : Cloudinary ID / URL

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
Authorization: Token token=pPOkrHtGHg9qkJQgR0YYsBW07EM
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/stdslot/37</pre>

#### Body
```javascript
{
  "photos" : [
    {
      "publicId" : "v1234567/dfhjghjkdisudgfds7sly.jpg",
      "position" : "1",
      "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/37&quot; -d &#39;{&quot;photos&quot;:[{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7sly.jpg&quot;,&quot;position&quot;:&quot;1&quot;,&quot;localId&quot;:&quot;B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=pPOkrHtGHg9qkJQgR0YYsBW07EM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;da6fc6991a8b179a9ba2a7a88ad75699&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dc38a49d-ef1a-4da5-882b-a74330439b5b
X-Runtime: 0.046728
Content-Length: 755</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 37,
  "title" : "Slot title 32",
  "startDate" : "2019-09-06T08:44:02.000Z",
  "createdAt" : "2015-06-10T11:53:25.889Z",
  "updatedAt" : "2015-06-10T11:53:25.889Z",
  "deletedAt" : null,
  "endDate" : "2019-10-06T08:44:02.000Z",
  "location" : {
    "id" : 34,
    "name" : "Acapulco",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "creator" : {
    "id" : 202,
    "username" : "User 199",
    "createdAt" : "2015-06-10T11:53:25.879Z",
    "updatedAt" : "2015-06-10T11:53:25.879Z",
    "deletedAt" : null,
    "image" : null
  },
  "notes" : [],
  "photos" : [
    {
      "mediaId" : 31,
      "clyid" : "v1234567/dfhjghjkdisudgfds7sly.jpg",
      "position" : 1,
      "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
    }
  ],
  "voices" : [],
  "videos" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
