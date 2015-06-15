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

Name : voices
Description : Voice recordings for the slot

Name : videos
Description : Videos recordings for the slot

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

### Request

#### Headers

<pre>Authorization: Token token=CtRaw57H-7wpmnGKxiUj3OzrYss
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/40</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/40&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=CtRaw57H-7wpmnGKxiUj3OzrYss&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8ca5ccceae0dfe3c9f8ec3b6b68ae4d8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f890a1b9-9adb-410b-a946-578ba769065f
X-Runtime: 0.181770
Content-Length: 867</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 40,
  "title" : "Slot title 35",
  "startDate" : "2019-09-09T11:44:02.000Z",
  "createdAt" : "2015-06-15T11:19:14.751Z",
  "updatedAt" : "2015-06-15T11:19:14.908Z",
  "deletedAt" : "2015-06-15T11:19:14.906Z",
  "endDate" : "2019-10-09T11:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 177,
    "username" : "User 174",
    "createdAt" : "2015-06-15T11:19:14.747Z",
    "updatedAt" : "2015-06-15T11:19:14.747Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "photos" : [],
  "voices" : [],
  "videos" : [],
  "media" : [
    {
      "mediaId" : 37,
      "clyid" : "dfhjghjkdisudgfds7iy33",
      "position" : 2,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 36,
      "clyid" : "dfhjghjkdisudgfds7iy32",
      "position" : 1,
      "localId" : null,
      "mediaType" : "photo"
    },
    {
      "mediaId" : 35,
      "clyid" : "dfhjghjkdisudgfds7iy31",
      "position" : 0,
      "localId" : null,
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
