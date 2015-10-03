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

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Authorization: Token token=6s4_UdMjJVknEenXjrb3WvsU6hs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groupslot/50</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groupslot/50&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=6s4_UdMjJVknEenXjrb3WvsU6hs&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dbb35e2ec7b6984ed5b224107b6806a6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9997d22b-e6e9-48c6-94e8-5abea347308e
X-Runtime: 0.069076
Vary: Origin
Content-Length: 542</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 50,
  "title" : "Slot title 41",
  "startDate" : "2019-09-15T17:44:02.000Z",
  "createdAt" : "2015-09-28T10:15:57.129Z",
  "updatedAt" : "2015-09-28T10:15:57.165Z",
  "deletedAt" : "2015-09-28T10:15:57.161Z",
  "endDate" : "2019-10-15T17:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 259,
    "username" : "User 223",
    "createdAt" : "2015-09-28T10:15:57.124Z",
    "updatedAt" : "2015-09-28T10:15:57.124Z",
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
    "id" : 42
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
