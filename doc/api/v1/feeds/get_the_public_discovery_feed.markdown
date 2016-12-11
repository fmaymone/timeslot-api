# Feeds API

## Get the public discovery feed

### GET /v1/feed/discovery

### Parameters

Name : limit
Description : Maximum count of items which are included in the result

Name : offset
Description : The offset value how many result items should be skipped before the limits start counting (or use cursor instead)

Name : cursor
Description : The ID of the activity to start loading from (not included) (or use offset instead)


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

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : firstName
Description : First name of the user

Name : middleName
Description : Middle name of the user

Name : lastName
Description : Last name of the user

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : slotCount
Description : Number of visible slots for this user

Name : calendarCount
Description : Number of visible calendars for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: 
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/discovery</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/discovery&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: &quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6fa0fb711d2ec64b59069c97fd1239ef&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 43ba1d49-2ba1-4bcf-980c-4b56b405765f
X-Runtime: 0.008289
Content-Length: 4730</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "cursor" : 0,
  "next" : null,
  "prev" : null,
  "results" : [
    {
      "target" : "group",
      "action" : "create",
      "time" : "2016-12-11T19:54:18.257Z",
      "id" : "F3A22EE1B4ED7F980858A7308BC79BABF4569D05",
      "message" : "{actor} created the calendar: {group}.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : {
        "id" : "1b6c3cf0-b4de-4953-8c8a-bdffee4d3fe4",
        "name" : "Testgroup 123",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-12-11T19:54:18.257Z",
        "updatedAt" : "2016-12-11T19:54:18.257Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          280
        ],
        "memberCount" : 1,
        "slotCount" : 0,
        "previewSlots" : []
      },
      "slot" : null,
      "user" : {
        "id" : 280,
        "username" : "User 388",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:18.200Z",
        "updatedAt" : "2016-12-11T19:54:18.200Z",
        "deletedAt" : null,
        "image" : ""
      }
    },
    {
      "target" : "slot",
      "action" : "create",
      "time" : "2016-12-11T19:54:18.236Z",
      "id" : "9B63772BD0845BEC809CEEFFC1632A571FA7D202",
      "message" : "{actor} creates this Slot.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 111,
        "title" : "Slot title 84",
        "description" : "",
        "startDate" : "2019-09-04T12:44:02.000Z",
        "rrule" : "",
        "createdAt" : "2016-12-11T19:54:18.236Z",
        "updatedAt" : "2016-12-11T19:54:18.236Z",
        "deletedAt" : null,
        "endDate" : "2019-10-04T12:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likerIds" : [],
        "likes" : 0,
        "commentsCounter" : 0,
        "firstGroup" : null,
        "slotGroupUuids" : []
      },
      "user" : {
        "id" : 280,
        "username" : "User 388",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:18.200Z",
        "updatedAt" : "2016-12-11T19:54:18.200Z",
        "deletedAt" : null,
        "image" : ""
      }
    },
    {
      "target" : "slot",
      "action" : "create",
      "time" : "2016-12-11T19:54:18.221Z",
      "id" : "8BA0DEDC9D74D0CDCFD0365CD83776C14C79E0DD",
      "message" : "{actor} creates this Slot.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 110,
        "title" : "Slot title 83",
        "description" : "",
        "startDate" : "2019-09-03T11:44:02.000Z",
        "rrule" : "",
        "createdAt" : "2016-12-11T19:54:18.221Z",
        "updatedAt" : "2016-12-11T19:54:18.221Z",
        "deletedAt" : null,
        "endDate" : "2019-10-03T11:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likerIds" : [],
        "likes" : 0,
        "commentsCounter" : 0,
        "firstGroup" : null,
        "slotGroupUuids" : []
      },
      "user" : {
        "id" : 280,
        "username" : "User 388",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:18.200Z",
        "updatedAt" : "2016-12-11T19:54:18.200Z",
        "deletedAt" : null,
        "image" : ""
      }
    },
    {
      "target" : "slot",
      "action" : "create",
      "time" : "2016-12-11T19:54:18.210Z",
      "id" : "D27191CA4BCF869A39B307A23C8BD05A7F9F17A6",
      "message" : "{actor} creates this Slot.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 109,
        "title" : "Slot title 82",
        "description" : "",
        "startDate" : "2019-09-02T10:44:02.000Z",
        "rrule" : "",
        "createdAt" : "2016-12-11T19:54:18.210Z",
        "updatedAt" : "2016-12-11T19:54:18.478Z",
        "deletedAt" : null,
        "endDate" : "2019-10-02T10:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:18.200Z",
          "updatedAt" : "2016-12-11T19:54:18.200Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likerIds" : [],
        "likes" : 0,
        "commentsCounter" : 2,
        "firstGroup" : null,
        "slotGroupUuids" : []
      },
      "user" : {
        "id" : 280,
        "username" : "User 388",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:18.200Z",
        "updatedAt" : "2016-12-11T19:54:18.200Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  ]
}
```
