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

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=GV1cBJoxtv-aQ3geu9XAyVeTPJo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/reslot</pre>

#### Body
```javascript
{
  "predecessorId" : 35
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/reslot&quot; -d &#39;{&quot;predecessorId&quot;:35}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=GV1cBJoxtv-aQ3geu9XAyVeTPJo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;803c1d565779e908feb92cc76c04b77b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 46447196-c402-4662-89f6-a85faff589bb
X-Runtime: 0.114773
Vary: Origin
Content-Length: 560</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Slot title 30",
  "startDate" : "2019-09-04T06:44:02.000Z",
  "createdAt" : "2015-09-20T18:49:27.108Z",
  "updatedAt" : "2015-09-20T18:49:27.108Z",
  "deletedAt" : null,
  "endDate" : "2019-10-04T06:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 221,
    "username" : "User 193",
    "createdAt" : "2015-09-20T18:49:26.934Z",
    "updatedAt" : "2015-09-20T18:49:26.934Z",
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
    "id" : 223
  },
  "parent" : {
    "id" : 35
  },
  "visibility" : null,
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
