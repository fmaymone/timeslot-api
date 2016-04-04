# Slots API

## Create new slot

### POST /v1/slots

Creates new slot for user and adds it to the users &#39;MyCalendar&#39; and to all slotGroups which were given additionally.

Returns data of new slot and array with unauthorized slotgroup UUIDs (User has no write access or slotgroup deleted).

Returns 422 if parameters are invalid or missing.

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

Name : visibility *- required -*
Description : Visibility of the Slot (private/friends/foaf/public)

Name : slotGroups
Description : Array with UUIDs of the SlotGroups slot should be added to


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

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=-hsJvbHApQq1NZB7SlLIM4KmPG4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
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
  },
  "visibility" : "private",
  "slotGroups" : [
    "b9850057-0619-4b6c-8faf-67122592e949",
    "99650221-1c16-48ba-8aa2-b6f12c268e2d",
    "c7e5b3d6-76b3-4270-b0be-c48adbeb1cb3",
    "91ddaf48-611c-4971-a50b-4115ef8af951",
    "35748e6a-ad9b-411e-a26a-ef9160a85cf3"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;2014-09-13T22:03:24.000Z&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;,&quot;slotGroups&quot;:[&quot;b9850057-0619-4b6c-8faf-67122592e949&quot;,&quot;99650221-1c16-48ba-8aa2-b6f12c268e2d&quot;,&quot;c7e5b3d6-76b3-4270-b0be-c48adbeb1cb3&quot;,&quot;91ddaf48-611c-4971-a50b-4115ef8af951&quot;,&quot;35748e6a-ad9b-411e-a26a-ef9160a85cf3&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-hsJvbHApQq1NZB7SlLIM4KmPG4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f7cb8e8df3247f35935c6736c33a2dbc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b705c65d-0830-49fa-aeb8-2ec721c8891e
X-Runtime: 0.135373
Vary: Origin
Content-Length: 895</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 1,
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "createdAt" : "2016-04-04T20:50:30.980Z",
  "updatedAt" : "2016-04-04T20:50:30.980Z",
  "deletedAt" : null,
  "endDate" : "2014-09-13T22:03:24.000Z",
  "location" : null,
  "creator" : {
    "id" : 1,
    "username" : "User 296",
    "createdAt" : "2016-04-04T20:50:30.917Z",
    "updatedAt" : "2016-04-04T20:50:30.917Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 1,
    "calendarCount" : 3,
    "friendsCount" : 0
  },
  "notes" : [
    {
      "id" : 2,
      "title" : "and another title",
      "content" : "more content here",
      "localId" : null,
      "createdAt" : "2016-04-04T20:50:31.010Z"
    },
    {
      "id" : 1,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "localId" : null,
      "createdAt" : "2016-04-04T20:50:31.007Z"
    }
  ],
  "media" : [],
  "settings" : {
    "alerts" : "omitted"
  },
  "visibility" : "private",
  "likes" : 0,
  "commentsCounter" : 0,
  "unauthorizedSlotgroups" : [
    "91ddaf48-611c-4971-a50b-4115ef8af951",
    "35748e6a-ad9b-411e-a26a-ef9160a85cf3"
  ]
}
```
