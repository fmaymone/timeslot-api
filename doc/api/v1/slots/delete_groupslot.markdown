# Slots API

## Delete GroupSlot

### DELETE /v1/groupslot/:id

Sets &#39;deletedAt&#39;, returns updated Group Slot data. Doesn&#39;t delete anything.

returns 404 if ID is invalid

### Parameters

Name : id *- required -*
Description : ID of the Group Slot to delete


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

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Authorization: Token token=MU0Nptb2AN4xN41sC8312klKzHk
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groupslot/10</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groupslot/10&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=MU0Nptb2AN4xN41sC8312klKzHk&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;61636603efd1c984d2dcdb8aa78fe5f2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 069a057e-a489-4cd5-9a2b-fbfeb47b20bf
X-Runtime: 0.044239
Vary: Origin
Content-Length: 540</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 10,
  "title" : "Slot title 42",
  "startDate" : "2019-09-20T22:44:02.000Z",
  "createdAt" : "2015-10-30T15:01:05.044Z",
  "updatedAt" : "2015-10-30T15:01:05.068Z",
  "deletedAt" : "2015-10-30T15:01:05.065Z",
  "endDate" : "2019-10-20T22:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 24,
    "username" : "User 242",
    "createdAt" : "2015-10-30T15:01:05.040Z",
    "updatedAt" : "2015-10-30T15:01:05.040Z",
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
  "group" : {
    "id" : 1
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
