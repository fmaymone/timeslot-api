# Slots API

## Delete StandardSlot

### DELETE /v1/slots/:id

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

Name : description
Description : Description for the slot

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

Name : likerIds
Description : Array with IDs of Users who like the slot

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

<pre>Authorization: Token token=1Gm33FG0i_-_dy7XAl-mHfE3pps
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/slots/18</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/18&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=1Gm33FG0i_-_dy7XAl-mHfE3pps&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3cd4dac5623feb9d40da9c38de0f0f64&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7bac7153-a717-4bfc-9387-1bd21ca561b2
X-Runtime: 0.122229
Content-Length: 711</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 18,
  "title" : "Slot title 174",
  "description" : "",
  "startDate" : "2019-09-13T06:44:02.000Z",
  "createdAt" : "2016-08-30T09:51:08.305Z",
  "updatedAt" : "2016-08-30T09:51:08.363Z",
  "deletedAt" : "2016-08-30T09:51:08.362Z",
  "endDate" : "2019-10-13T06:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 38,
    "username" : "User 744",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:08.296Z",
    "updatedAt" : "2016-08-30T09:51:08.296Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "calendarCount" : 0,
    "friendsCount" : 0
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likerIds" : [],
  "likes" : 0,
  "commentsCounter" : 0,
  "firstGroup" : null,
  "slotGroupUuids" : [],
  "unauthorizedSlotgroups" : []
}
```
