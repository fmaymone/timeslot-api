# Slots API

## Create StandardSlot with default location

### POST /v1/stdslot

Returns data of new slot.

Missing unrequiered fields will be filled with default values.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : visibility *- required -*
Description : Visibility of the Slot (private/friends/foaf/public)

Name : slotSets
Description : Array with UUIDs of the SlotGroups and SlotSets the slot should be added to

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

Name : reslotsCounter
Description : Number of reslots for this slot

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=86FuQDExKOHE3-eMJfJa_mtbc5Y
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/stdslot</pre>

#### Body
```javascript
{
  "visibility" : "private",
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "2014-09-13T22:03:24.000Z",
  "notes" : [
    {
      "title" : "revolutionizing the calendar",
      "content" : "this is content"
    },
    {
      "title" : "and another title",
      "content" : "more content here"
    }
  ],
  "settings" : {
    "alerts" : "0101010101"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/stdslot&quot; -d &#39;{&quot;visibility&quot;:&quot;private&quot;,&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=86FuQDExKOHE3-eMJfJa_mtbc5Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2e7efba1a8fb6e3932591ad6fbfb47d1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d3427a56-3899-482d-8058-5fe8cbe4498c
X-Runtime: 0.034397
Content-Length: 835</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 36,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2016-05-01T22:54:13.524Z",
  "updatedAt" : "2016-05-01T22:54:13.524Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : null,
  "creator" : {
    "id" : 147,
    "username" : "User 457",
    "createdAt" : "2016-05-01T22:54:13.514Z",
    "updatedAt" : "2016-05-01T22:54:13.514Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 1,
    "calendarCount" : 0,
    "friendsCount" : 0
  },
  "notes" : [
    {
      "id" : 6,
      "title" : "and another title",
      "content" : "more content here",
      "localId" : null,
      "createdAt" : "2016-05-01T22:54:13.532Z"
    },
    {
      "id" : 5,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "localId" : null,
      "createdAt" : "2016-05-01T22:54:13.529Z"
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
  "unauthorizedSlotgroups" : []
}
```
