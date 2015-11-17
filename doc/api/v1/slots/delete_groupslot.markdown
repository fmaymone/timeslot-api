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

Name : groupId
Description : ID of the group the slot belongs to

### Request

#### Headers

<pre>Authorization: Token token=cJeNRtICH2pXRX71jktHPTG3Lsc
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groupslot/10</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groupslot/10&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=cJeNRtICH2pXRX71jktHPTG3Lsc&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aad664a566f46bdaea9de63123af5279&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d0604c30-e79f-403e-8412-18914077b4ee
X-Runtime: 0.089689
Vary: Origin
Content-Length: 510</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 10,
  "title" : "Slot title 65",
  "startDate" : "2019-09-16T21:44:02.000Z",
  "createdAt" : "2015-11-17T23:46:15.726Z",
  "updatedAt" : "2015-11-17T23:46:15.761Z",
  "deletedAt" : "2015-11-17T23:46:15.756Z",
  "endDate" : "2019-10-16T21:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 24,
    "username" : "User 301",
    "createdAt" : "2015-11-17T23:46:15.722Z",
    "updatedAt" : "2015-11-17T23:46:15.722Z",
    "deletedAt" : null,
    "image" : ""
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
