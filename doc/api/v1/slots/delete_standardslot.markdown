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

<pre>Authorization: Token token=iZKFPwTiC_MAoKtnLS8MoOMFRqo
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/46</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/46&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=iZKFPwTiC_MAoKtnLS8MoOMFRqo&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7fc36c96f994aa9638059b5fd90e03e9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 04a1079b-9ee6-41a4-ab85-5770883603ab
X-Runtime: 9.721767
Vary: Origin
Content-Length: 1475</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 46,
  "title" : "Slot title 39",
  "startDate" : "2019-09-13T15:44:02.000Z",
  "createdAt" : "2015-09-14T10:32:46.889Z",
  "updatedAt" : "2015-09-14T10:32:56.579Z",
  "deletedAt" : "2015-09-14T10:32:56.575Z",
  "endDate" : "2019-10-13T15:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 252,
    "username" : "User 218",
    "createdAt" : "2015-09-14T10:32:46.883Z",
    "updatedAt" : "2015-09-14T10:32:46.883Z",
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
      "createdAt" : "2015-09-14T10:32:46.907Z",
      "duration" : null,
      "title" : "Title 44"
    },
    {
      "mediaId" : 49,
      "publicId" : "dfhjghjkdisudgfds7iy45",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-14T10:32:46.905Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 48,
      "publicId" : "dfhjghjkdisudgfds7iy44",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-09-14T10:32:46.902Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 47,
      "publicId" : "dfhjghjkdisudgfds7iy43",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:46.898Z"
    },
    {
      "mediaId" : 46,
      "publicId" : "dfhjghjkdisudgfds7iy42",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:46.895Z"
    },
    {
      "mediaId" : 45,
      "publicId" : "dfhjghjkdisudgfds7iy41",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-09-14T10:32:46.892Z"
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
