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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : slotter
Description : contains ID of the User who did reslot

Name : parent
Description : contains ID of the original slot that was reslottet

### Request

#### Headers

<pre>Authorization: Token token=5ZS_izZdtC-HTc0e-xjQBPr-n5w
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/11</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot/11&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=5ZS_izZdtC-HTc0e-xjQBPr-n5w&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3c02c4a5d0b85a0930ceeb3f28146b5d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4dd72630-5d47-4754-ba66-8453cb46943f
X-Runtime: 0.144713
Vary: Origin
Content-Length: 745</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 11,
  "title" : "Slot title 92",
  "startDate" : "2019-09-16T00:44:02.000Z",
  "createdAt" : "2016-01-29T19:39:12.921Z",
  "updatedAt" : "2016-01-29T19:39:13.116Z",
  "deletedAt" : "2016-01-29T19:39:13.105Z",
  "endDate" : "2019-10-16T00:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 24,
    "username" : "User 354",
    "createdAt" : "2016-01-29T19:39:12.851Z",
    "updatedAt" : "2016-01-29T19:39:12.851Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "public",
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 23,
    "username" : "User 353",
    "createdAt" : "2016-01-29T19:39:12.835Z",
    "updatedAt" : "2016-01-29T19:39:12.835Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0
  },
  "parent" : {
    "id" : 10
  },
  "likes" : 0,
  "commentsCounter" : 0
}
```
