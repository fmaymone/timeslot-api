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

Name : slotterId
Description : ID of the User who did reslot

### Request

#### Headers

<pre>Authorization: Token token=OG_PUZ926S0CHaHeFKHJQys0UQY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/41</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/reslot/41&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=OG_PUZ926S0CHaHeFKHJQys0UQY&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1f8aaeda87c7f7653370e62b8bc83fd5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ee24eef4-57df-4ea8-8350-2417f69c82fb
X-Runtime: 0.039852
Content-Length: 542</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 41,
  "title" : "Slot title 39",
  "createdAt" : "2015-05-22T15:50:02.494Z",
  "updatedAt" : "2015-05-22T15:50:02.528Z",
  "deletedAt" : "2015-05-22T15:50:02.525Z",
  "startDate" : "2014-09-28T13:31:02.000Z",
  "endDate" : "2014-10-13T15:44:02.000Z",
  "visibility" : null,
  "location" : null,
  "creator" : {
    "id" : 182,
    "username" : "User 179",
    "createdAt" : "2015-05-22T15:50:02.497Z",
    "updatedAt" : "2015-05-22T15:50:02.497Z",
    "deletedAt" : null
  },
  "settings" : {
    "alerts" : "0000000000"
  },
  "slotterId" : 179,
  "notes" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null,
  "photos" : [],
  "voices" : [],
  "videos" : []
}
```
