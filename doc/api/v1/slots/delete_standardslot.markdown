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

### Request

#### Headers

<pre>Authorization: Token token=eHdb9VrHKb5DNMf2jTxd7ujMoeg
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/stdslot/8</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/stdslot/8&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=eHdb9VrHKb5DNMf2jTxd7ujMoeg&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e3cb6ef162ec2ffd2746d9aed01098b2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c8f71790-7eab-4c5b-a2d4-76fb3c7e0aa5
X-Runtime: 0.051966
Vary: Origin
Content-Length: 594</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 8,
  "title" : "Slot title 70",
  "startDate" : "2019-09-21T02:44:02.000Z",
  "createdAt" : "2015-12-23T11:18:35.023Z",
  "updatedAt" : "2015-12-23T11:18:35.046Z",
  "deletedAt" : "2015-12-23T11:18:35.044Z",
  "endDate" : "2019-10-21T02:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 19,
    "username" : "User 310",
    "createdAt" : "2015-12-23T11:18:35.014Z",
    "updatedAt" : "2015-12-23T11:18:35.014Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 0,
    "friendsCount" : 0
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "reslotsCounter" : 0,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
