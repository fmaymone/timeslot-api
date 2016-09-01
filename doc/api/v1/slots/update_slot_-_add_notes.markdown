# Slots API

## Update Slot - Add notes

### PATCH /v1/slots/:id

### Parameters

Name : id *- required -*
Description : ID of the slot to update

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration).

Name : description
Description : Description for the slot (max. 500 characters)

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

Name : notes *- required -*
Description : Scope for new notes

Name : title *- required -*
Description : Title of the note

Name : content *- required -*
Description : Content of the note

Name : localId
Description : Local ID of the note, temporary feature


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

<pre>Content-Type: application/json
Authorization: Token token=trpuK0g1pfLY-uQXM98bDlWPR3k
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/slots/13</pre>

#### Body
```javascript
{
  "notes" : [
    {
      "title" : "Title for Note 182",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "localId" : "123321"
    },
    {
      "title" : "Title for Note 183",
      "content" : "Liebe ist ein Kind der Freiheit!"
    }
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots/13&quot; -d &#39;{&quot;notes&quot;:[{&quot;title&quot;:&quot;Title for Note 182&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;,&quot;localId&quot;:&quot;123321&quot;},{&quot;title&quot;:&quot;Title for Note 183&quot;,&quot;content&quot;:&quot;Liebe ist ein Kind der Freiheit!&quot;}]}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=trpuK0g1pfLY-uQXM98bDlWPR3k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4e94a9111a0e1d24ffeebba755b016c6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f5e2072a-2833-4d58-96b4-eedeffd9de13
X-Runtime: 0.116455
Content-Length: 894</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 13,
  "title" : "Slot title 169",
  "description" : "",
  "startDate" : "2019-09-08T01:44:02.000Z",
  "createdAt" : "2016-08-30T09:51:07.727Z",
  "updatedAt" : "2016-08-30T09:51:07.727Z",
  "deletedAt" : null,
  "endDate" : "2019-10-08T01:44:02.000Z",
  "location" : null,
  "creator" : {
    "id" : 25,
    "username" : "User 731",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:07.707Z",
    "updatedAt" : "2016-08-30T09:51:07.707Z",
    "deletedAt" : null,
    "image" : ""
  },
  "notes" : [
    {
      "id" : 11,
      "title" : "Title for Note 182",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "localId" : "123321",
      "createdAt" : "2016-08-30T09:51:07.744Z"
    },
    {
      "id" : 12,
      "title" : "Title for Note 183",
      "content" : "Liebe ist ein Kind der Freiheit!",
      "localId" : null,
      "createdAt" : "2016-08-30T09:51:07.786Z"
    }
  ],
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
  "visibleCount" : "1"
}
```
