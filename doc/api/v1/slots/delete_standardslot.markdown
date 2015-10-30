# Slots API

## Delete StandardSlot

### DELETE /v1/stdslot/:id

Sets &#39;deletedAt&#39;, returns updated Standard Slot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Standard Slot to delete


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

<pre>Authorization: Token token=kElr0-cRnZdPKgJoKHp7XWo_WUo
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/8</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/8&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=kElr0-cRnZdPKgJoKHp7XWo_WUo&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1d30288554e0d41fe564173031c5bb6a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 167e72fb-af66-4a48-8dbf-91e9ff266435
X-Runtime: 0.277826
Vary: Origin
Content-Length: 1487</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 8,
  "title" : "Slot title 40",
  "startDate" : "2019-09-18T20:44:02.000Z",
  "createdAt" : "2015-10-30T15:01:04.686Z",
  "updatedAt" : "2015-10-30T15:01:04.948Z",
  "deletedAt" : "2015-10-30T15:01:04.945Z",
  "endDate" : "2019-10-18T20:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 20,
    "username" : "User 238",
    "createdAt" : "2015-10-30T15:01:04.682Z",
    "updatedAt" : "2015-10-30T15:01:04.682Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 10,
      "publicId" : "dfhjghjkdisudgfds7iy71",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-10-30T15:01:04.700Z",
      "duration" : null,
      "title" : "Title 69"
    },
    {
      "mediaId" : 9,
      "publicId" : "dfhjghjkdisudgfds7iy70",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:04.698Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 8,
      "publicId" : "dfhjghjkdisudgfds7iy69",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-10-30T15:01:04.695Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 7,
      "publicId" : "dfhjghjkdisudgfds7iy68",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:04.693Z"
    },
    {
      "mediaId" : 6,
      "publicId" : "dfhjghjkdisudgfds7iy67",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:04.691Z"
    },
    {
      "mediaId" : 5,
      "publicId" : "dfhjghjkdisudgfds7iy66",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-10-30T15:01:04.688Z"
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
