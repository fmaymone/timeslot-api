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

Name : slotterId
Description : ID of the User who did reslot

### Request

#### Headers

<pre>Authorization: Token token=dlPIGW4-2r1tB7C16mqrsOR66fo
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/reslot/53</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot/53&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=dlPIGW4-2r1tB7C16mqrsOR66fo&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b78681ac6d99a2deca98323d101129a4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 975f0451-4dca-4e6b-a164-6068c2a684f6
X-Runtime: 0.039554
Vary: Origin
Content-Length: 586</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 53,
  "title" : "Slot title 44",
  "startDate" : "2019-09-18T20:44:02.000Z",
  "createdAt" : "2015-10-03T22:30:43.653Z",
  "updatedAt" : "2015-10-03T22:30:43.696Z",
  "deletedAt" : "2015-10-03T22:30:43.692Z",
  "endDate" : "2019-10-18T20:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 265,
    "username" : "User 229",
    "createdAt" : "2015-10-03T22:30:43.656Z",
    "updatedAt" : "2015-10-03T22:30:43.656Z",
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
  "slotter" : {
    "id" : 262
  },
  "parent" : {
    "id" : 54
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
