# Slots API

## Create StandardSlot with open End

### POST /v1/slots

Returns data of new slot.

The empty endDate will internally be set to the end of the start day but will not be returned in json.

returns 422 if parameters are invalid

returns 422 if required parameters are missing

### Parameters

Name : title *- required -*
Description : Title of slot (max. 60 characters)

Name : startDate *- required -*
Description : Startdate and Time of the Slot

Name : endDate *- required -*
Description : Enddate and Time of the Slot (startdate + duration).

Name : rrule
Description : Repeating Rule for the Slot.

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

Name : visibility
Description : Deprecated: Visibility of the Slot (private/friends/foaf/public)

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

Name : rrule
Description : Repeating Rule for the slot

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

Name : reslotsCounter
Description : Number of reslots for this slot

Name : unauthorizedSlotgroups
Description : Array of Slotgroup UUIDs where the current_user has no write access or Slotgroup was deleted. Will be empty if all worked fine.

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=CRzVsi_8Sp2AgbFAPACwjXUSDUw
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/slots</pre>

#### Body
```javascript
{
  "title" : "Time for a Slot",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "endDate" : "",
  "rrule" : "RRULE:FREQ=WEEKLY;BYDAY=TH",
  "description" : "One day it will all make sense.",
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
    "3ee10092-56e0-4734-9ee4-c101d00aad51",
    "ffc2f8e9-8bfe-4a26-afdd-a2a1d06cc301",
    "51d7b123-0eb2-45a9-b2dd-5f3f0af09666",
    "750f2c99-a539-4bd8-b2dd-813f51034de5",
    "525e0250-7fba-45b8-a40f-1bb139b7ad11"
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/slots&quot; -d &#39;{&quot;title&quot;:&quot;Time for a Slot&quot;,&quot;startDate&quot;:&quot;2014-09-08T13:31:02.000Z&quot;,&quot;endDate&quot;:&quot;&quot;,&quot;rrule&quot;:&quot;RRULE:FREQ=WEEKLY;BYDAY=TH&quot;,&quot;description&quot;:&quot;One day it will all make sense.&quot;,&quot;notes&quot;:[{&quot;title&quot;:&quot;revolutionizing the calendar&quot;,&quot;content&quot;:&quot;this is content&quot;},{&quot;title&quot;:&quot;and another title&quot;,&quot;content&quot;:&quot;more content here&quot;}],&quot;settings&quot;:{&quot;alerts&quot;:&quot;0101010101&quot;},&quot;visibility&quot;:&quot;private&quot;,&quot;slotGroups&quot;:[&quot;3ee10092-56e0-4734-9ee4-c101d00aad51&quot;,&quot;ffc2f8e9-8bfe-4a26-afdd-a2a1d06cc301&quot;,&quot;51d7b123-0eb2-45a9-b2dd-5f3f0af09666&quot;,&quot;750f2c99-a539-4bd8-b2dd-813f51034de5&quot;,&quot;525e0250-7fba-45b8-a40f-1bb139b7ad11&quot;]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CRzVsi_8Sp2AgbFAPACwjXUSDUw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;43aae8aeb2680d80d166ae707ef63350&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b06ce409-809a-47fa-8d85-71681b609f87
X-Runtime: 0.273361
Content-Length: 1641</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 2,
  "title" : "Time for a Slot",
  "description" : "One day it will all make sense.",
  "startDate" : "2014-09-08T13:31:02.000Z",
  "rrule" : "RRULE:FREQ=WEEKLY;BYDAY=TH",
  "createdAt" : "2016-12-11T19:54:35.512Z",
  "updatedAt" : "2016-12-11T19:54:35.512Z",
  "deletedAt" : null,
  "location" : null,
  "creator" : {
    "id" : 4,
    "username" : "User 708",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-12-11T19:54:35.448Z",
    "updatedAt" : "2016-12-11T19:54:35.448Z",
    "deletedAt" : null,
    "image" : "",
    "location" : null,
    "slotCount" : 1,
    "calendarCount" : 3,
    "friendsCount" : 0
  },
  "notes" : [
    {
      "id" : 3,
      "title" : "revolutionizing the calendar",
      "content" : "this is content",
      "localId" : null,
      "createdAt" : "2016-12-11T19:54:35.518Z"
    },
    {
      "id" : 4,
      "title" : "and another title",
      "content" : "more content here",
      "localId" : null,
      "createdAt" : "2016-12-11T19:54:35.553Z"
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
  "firstGroup" : {
    "id" : "ffc2f8e9-8bfe-4a26-afdd-a2a1d06cc301",
    "name" : "Testgroup 201",
    "image" : "",
    "description" : null,
    "defaultColor" : "000000",
    "membersCanPost" : false,
    "membersCanInvite" : false,
    "public" : false,
    "createdAt" : "2016-12-11T19:54:35.461Z",
    "updatedAt" : "2016-12-11T19:54:35.461Z",
    "deletedAt" : null,
    "owner" : {
      "id" : 4,
      "username" : "User 708",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-12-11T19:54:35.448Z",
      "updatedAt" : "2016-12-11T19:54:35.448Z",
      "deletedAt" : null,
      "image" : ""
    },
    "memberIds" : [
      4
    ],
    "memberCount" : 1,
    "slotCount" : 1
  },
  "slotGroupUuids" : [
    "ffc2f8e9-8bfe-4a26-afdd-a2a1d06cc301",
    "51d7b123-0eb2-45a9-b2dd-5f3f0af09666"
  ],
  "unauthorizedSlotgroups" : [
    "750f2c99-a539-4bd8-b2dd-813f51034de5",
    "525e0250-7fba-45b8-a40f-1bb139b7ad11"
  ]
}
```
