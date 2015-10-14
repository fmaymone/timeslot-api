# Slots API

## Create GroupSlot

### POST /v1/groupslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 404 if Group ID is invalid

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration).

Name : location
Description : Location associated with this slot (see example)

Name : media
Description : Media items (image/audio/video) of to the Slot (see example)

Name : notes
Description : Notes for to the Slot (see example)

Name : settings
Description : User specific settings for the slot (alerts)

Name : alerts
Description : Alerts for the Slot

Name : groupId *- required -*
Description : ID of the group to which the Slot belongs


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

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=BqGx3Zvkpz58zSAtuOfXT6znupI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groupslot</pre>

#### Body
```javascript
{
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "settings" : {
    "alerts" : "0101010101"
  },
  "groupId" : 34
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groupslot&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;groupId&quot;:34}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=BqGx3Zvkpz58zSAtuOfXT6znupI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a58946d48a9d278c008d25f1fdc8cacb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d0b3a34d-588b-48aa-8023-fe01506202e4
X-Runtime: 0.051980
Vary: Origin
Content-Length: 545</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 17,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2015-10-14T11:49:45.583Z",
  "updatedAt" : "2015-10-14T11:49:45.583Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : null,
  "creator" : {
    "id" : 149,
    "username" : "User 202",
    "createdAt" : "2015-10-14T11:49:45.555Z",
    "updatedAt" : "2015-10-14T11:49:45.555Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "notes" : [],
  "media" : [],
  "settings" : {
    "alerts" : "0101010101"
  },
  "visibility" : "members",
  "group" : {
    "id" : 34
  },
  "likes" : 0,
  "commentsCounter" : 0,
  "shareUrl" : null
}
```
