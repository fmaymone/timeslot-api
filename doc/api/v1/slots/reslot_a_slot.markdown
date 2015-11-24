# Slots API

## Reslot a slot

### POST /v1/reslot

Returns data of new ReSlot.

returns 404 if Predecessor Slot doesn&#39;t exist

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : predecessorId *- required -*
Description : ID of the Slot which was resloted


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
Authorization: Token token=aRWQBKtC_mc3esTu2echZbGGZ04
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 48
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:48}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=aRWQBKtC_mc3esTu2echZbGGZ04&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;37f97edb2c55e999e129c2019a54ef85&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c4256cb5-0bd8-45f4-ba59-96e0b53401e9
X-Runtime: 0.047523
Vary: Origin
Content-Length: 550</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 49,
  "title" : "Slot title 58",
  "startDate" : "2019-09-09T14:44:02.000Z",
  "createdAt" : "2015-11-24T23:47:33.060Z",
  "updatedAt" : "2015-11-24T23:47:33.060Z",
  "deletedAt" : null,
  "endDate" : "2019-10-09T14:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 235,
    "username" : "User 276",
    "createdAt" : "2015-11-24T23:47:33.036Z",
    "updatedAt" : "2015-11-24T23:47:33.036Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "reslotsCounter" : 1,
  "slotter" : {
    "id" : 237
  },
  "parent" : {
    "id" : 48
  },
  "visibility" : "public",
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
