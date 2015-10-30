# Slots API

## Delete ReSlot

### DELETE /v1/reslot/:id

Sets &#39;deletedAt&#39;, returns updated reslot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the ReSlot to delete


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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Authorization: Token token=4H-ojuNctHuQ5T4UVikoho4tpdQ
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/13</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot/13&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=4H-ojuNctHuQ5T4UVikoho4tpdQ&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2e7b40018e7140b6fbe31f0807ce1964&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fd72270e-8fae-4d4a-991e-d3423a08edde
X-Runtime: 0.033782
Vary: Origin
Content-Length: 603</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 13,
  "title" : "Slot title 44",
  "startDate" : "2019-09-22T00:44:02.000Z",
  "createdAt" : "2015-10-30T15:01:05.148Z",
  "updatedAt" : "2015-10-30T15:01:05.165Z",
  "deletedAt" : "2015-10-30T15:01:05.162Z",
  "endDate" : "2019-10-22T00:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 28,
    "username" : "User 246",
    "createdAt" : "2015-10-30T15:01:05.130Z",
    "updatedAt" : "2015-10-30T15:01:05.130Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0000000000"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 27
  },
  "parent" : {
    "id" : 12
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
