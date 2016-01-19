# Slots API

## Reslot a public StandardSlot as private

### POST /v1/reslot

Returns data of new ReSlot.

returns 404 if Predecessor Slot doesn&#39;t exist

returns 422 if given visibility exceeds visibility of the parent

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : predecessorId *- required -*
Description : ID of the Slot which was resloted

Name : visibility
Description : Visibility of the ReSlot (private/friends/foaf/public).If not given it defaults to the visibility of the slot that was resloted (predecessor, which by now is always also the parent). The visibility can not exceed the visibility of the original Slot (Parent).


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

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=tS4QyfrhJZX-tpvB6jMVXTllhgA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 54,
  "visibility" : "private"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:54,&quot;visibility&quot;:&quot;private&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=tS4QyfrhJZX-tpvB6jMVXTllhgA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a3c2be36fe1e8d7cac98d53e1d04a14a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8c2b5fc6-6701-425e-9c32-a6231a5b3579
X-Runtime: 0.275932
Vary: Origin
Content-Length: 742</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 55,
  "title" : "Slot title 75",
  "startDate" : "2019-09-26T07:44:02.000Z",
  "createdAt" : "2016-01-19T21:47:45.686Z",
  "updatedAt" : "2016-01-19T21:47:45.686Z",
  "deletedAt" : null,
  "endDate" : "2019-10-26T07:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 233,
    "username" : "User 319",
    "createdAt" : "2016-01-19T21:47:45.545Z",
    "updatedAt" : "2016-01-19T21:47:45.545Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 235,
    "username" : "User 321",
    "createdAt" : "2016-01-19T21:47:45.617Z",
    "updatedAt" : "2016-01-19T21:47:45.617Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 1,
    "friendsCount" : 0
  },
  "parent" : {
    "id" : 54
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
