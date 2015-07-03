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

<pre>Authorization: Token token=G8tiwEwBa0dAqrGcCUPHYcYhtjU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/40</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/40&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=G8tiwEwBa0dAqrGcCUPHYcYhtjU&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c35b0e40f6224d0e0711a0da41f1f881&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 075b1f35-c41e-49de-884d-49cb0b95d505
X-Runtime: 0.369665
Content-Length: 859</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 40,
  "title" : "Slot title 35",
  "startDate" : "2019-09-09T11:44:02.000Z",
  "endDate" : "2019-10-09T11:44:02.000Z",
  "createdAt" : "2015-07-02T12:34:19.573Z",
  "updatedAt" : "2015-07-02T12:34:19.915Z",
  "deletedAt" : "2015-07-02T12:34:19.912Z",
  "openEnd" : false,
  "location" : null,
  "creator" : {
    "id" : 189,
    "username" : "User 174",
    "createdAt" : "2015-07-02T12:34:19.567Z",
    "updatedAt" : "2015-07-02T12:34:19.567Z",
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
