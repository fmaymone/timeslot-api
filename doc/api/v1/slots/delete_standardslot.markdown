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
Description : Visibiltiy of the slot (private/friend/foaf/public)

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

<pre>Authorization: Token token=bGTdFUN-vE9Hv0Hy1jA5OjM74oU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/8</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/8&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=bGTdFUN-vE9Hv0Hy1jA5OjM74oU&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;90a54e6fbd1246016f097d340d55f6f1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0fee0ec3-5851-4e0a-b088-8e55cb754222
X-Runtime: 0.278780
Vary: Origin
Content-Length: 1457</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 8,
  "title" : "Slot title 63",
  "startDate" : "2019-09-14T19:44:02.000Z",
  "createdAt" : "2015-11-17T23:46:15.363Z",
  "updatedAt" : "2015-11-17T23:46:15.633Z",
  "deletedAt" : "2015-11-17T23:46:15.631Z",
  "endDate" : "2019-10-14T19:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 20,
    "username" : "User 297",
    "createdAt" : "2015-11-17T23:46:15.356Z",
    "updatedAt" : "2015-11-17T23:46:15.356Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 10,
      "publicId" : "dfhjghjkdisudgfds7iy95",
      "position" : 5,
      "localId" : null,
      "mediaType" : "audio",
      "createdAt" : "2015-11-17T23:46:15.381Z",
      "duration" : null,
      "title" : "Title 93"
    },
    {
      "mediaId" : 9,
      "publicId" : "dfhjghjkdisudgfds7iy94",
      "position" : 4,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:15.377Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 8,
      "publicId" : "dfhjghjkdisudgfds7iy93",
      "position" : 3,
      "localId" : null,
      "mediaType" : "video",
      "createdAt" : "2015-11-17T23:46:15.375Z",
      "duration" : null,
      "thumbnail" : null
    },
    {
      "mediaId" : 7,
      "publicId" : "dfhjghjkdisudgfds7iy92",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:15.372Z"
    },
    {
      "mediaId" : 6,
      "publicId" : "dfhjghjkdisudgfds7iy91",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:15.369Z"
    },
    {
      "mediaId" : 5,
      "publicId" : "dfhjghjkdisudgfds7iy90",
      "position" : 0,
      "localId" : null,
      "mediaType" : "image",
      "createdAt" : "2015-11-17T23:46:15.366Z"
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
