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

Name : reslotsCounter
Description : Number of reslots for this slot

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

<pre>Authorization: Token token=eUHeWqZayBwRquaXq3X2SVoJ7iU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/48</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/48&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=eUHeWqZayBwRquaXq3X2SVoJ7iU&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ba0e4d308ccc8a941f4a02e8178aff8c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7a98e436-3b95-4bd4-8030-83a0d9445f0c
X-Runtime: 7.182059
Vary: Origin
Content-Length: 1475</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 48,
  "title" : "Slot title 39",
  "startDate" : "2019-09-13T15:44:02.000Z",
  "createdAt" : "2015-09-20T18:49:28.888Z",
  "updatedAt" : "2015-09-20T18:49:36.047Z",
  "deletedAt" : "2015-09-20T18:49:36.045Z",
  "endDate" : "2019-10-13T15:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 255,
    "username" : "User 219",
    "createdAt" : "2015-09-20T18:49:28.880Z",
    "updatedAt" : "2015-09-20T18:49:28.880Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 50,
      "publicId" : "dfhjghjkdisudgfds7iy46",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-09-20T18:49:28.906Z",
      "duration" : null,
      "title" : "Title 44"
    },
    {
      "mediaId" : 49,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-20T18:49:28.903Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 48,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-20T18:49:28.900Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 47,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-20T18:49:28.898Z"
    },
    {
      "mediaId" : 46,
      "publicId" : "dfhjghjkdisudgfds7iy42",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-20T18:49:28.895Z"
    },
    {
      "mediaId" : 45,
      "publicId" : "dfhjghjkdisudgfds7iy41",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-20T18:49:28.892Z"
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
