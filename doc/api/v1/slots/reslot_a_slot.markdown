# Slots API

## Reslot a slot

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
Authorization: Token token=iJWVxQtzH6uyA0tkTI62q2Od1KM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 15
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:15}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=iJWVxQtzH6uyA0tkTI62q2Od1KM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;10a0606848f4a6f4cbf235dfa7268ea1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6790affc-473b-4d13-8f10-a951e6582f0b
X-Runtime: 0.057717
Vary: Origin
Content-Length: 723</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 16,
  "title" : "Slot title 80",
  "startDate" : "2019-09-04T12:44:02.000Z",
  "createdAt" : "2016-01-29T19:39:09.754Z",
  "updatedAt" : "2016-01-29T19:39:09.754Z",
  "deletedAt" : null,
  "endDate" : "2019-10-04T12:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 35,
    "username" : "User 321",
    "createdAt" : "2016-01-29T19:39:09.723Z",
    "updatedAt" : "2016-01-29T19:39:09.723Z",
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
    "id" : 37,
    "username" : "User 323",
    "createdAt" : "2016-01-29T19:39:09.739Z",
    "updatedAt" : "2016-01-29T19:39:09.739Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 0,
    "reslotCount" : 1,
    "friendsCount" : 0
  },
  "parent" : {
    "id" : 15
  },
  "likes" : 0,
  "commentsCounter" : 0
}
```
