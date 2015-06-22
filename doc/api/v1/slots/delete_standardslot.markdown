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

<pre>Authorization: Token token=TqY1wxveh9JB6t5MEXET2AEzw5Q
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/40</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/40&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=TqY1wxveh9JB6t5MEXET2AEzw5Q&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f2f3551718566c145df847eb16c62233&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 632e1a74-dafe-4ab0-bdae-d21eb029d9a2
X-Runtime: 3.572403
Content-Length: 843</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 40,
  "title" : "Slot title 35",
  "startDate" : "2019-09-09T11:44:02.000Z",
  "createdAt" : "2015-06-22T08:44:20.553Z",
  "updatedAt" : "2015-06-22T08:44:24.104Z",
  "deletedAt" : "2015-06-22T08:44:24.102Z",
  "endDate" : "2019-10-09T11:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 177,
    "username" : "User 174",
    "createdAt" : "2015-06-22T08:44:20.548Z",
    "updatedAt" : "2015-06-22T08:44:20.548Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [
    {
      "mediaId" : 37,
      "publicId" : "dfhjghjkdisudgfds7iy33",
      "position" : 2,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 36,
      "publicId" : "dfhjghjkdisudgfds7iy32",
      "position" : 1,
      "localId" : null,
      "mediaType" : "image"
    },
    {
      "mediaId" : 35,
      "publicId" : "dfhjghjkdisudgfds7iy31",
      "position" : 0,
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
