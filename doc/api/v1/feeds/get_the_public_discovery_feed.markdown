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

Name : id
Description : ID of the user

Name : username
Description : Username of the user

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
ETag: W/&quot;7e228f797c396d264dc2f48d200e7576&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e0558790-8e60-48c0-8418-1e8d676fcf60
X-Runtime: 0.007679
Content-Length: 3561</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Group",
    "object" : "64",
    "model" : "Group",
    "target" : "64",
    "action" : "create",
    "foreign" : "273",
    "time" : "2016-05-25T11:08:26.182Z",
    "id" : "DE706E3BBF25C1C03A6F031A136E68D9BA25E96B",
    "actors" : [
      273
    ],
    "message" : "User 389 created the slot group: Testgroup 123.",
    "data" : {
      "target" : {
        "id" : "9f06547f-95e7-49bd-b091-95bec514344c",
        "name" : "Testgroup 123",
        "image" : "",
        "description" : null,
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-05-25T11:08:26.182Z",
        "updatedAt" : "2016-05-25T11:08:26.182Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 273,
          "username" : "User 389",
          "createdAt" : "2016-05-25T11:08:26.152Z",
          "updatedAt" : "2016-05-25T11:08:26.152Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          273
        ],
        "memberCount" : 1,
        "slotCount" : 0
      },
      "actor" : {
        "id" : 273,
        "username" : "User 389",
        "createdAt" : "2016-05-25T11:08:26.152Z",
        "updatedAt" : "2016-05-25T11:08:26.152Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  },
  {
    "type" : "Slot",
    "object" : "111",
    "model" : "StdSlotPublic",
    "target" : "111",
    "action" : "create",
    "foreign" : "273",
    "time" : "2016-05-25T11:08:26.179Z",
    "id" : "6D9F55CFF19D11192870CA4B275B9B1C8EE74AA1",
    "actors" : [
      273
    ],
    "message" : "User 389 creates this Slot.",
    "data" : {
      "target" : {
        "id" : 111,
        "title" : "Slot title 81",
        "startDate" : "2019-09-04T12:44:02.000Z",
        "createdAt" : "2016-05-25T11:08:26.179Z",
        "updatedAt" : "2016-05-25T11:08:26.179Z",
        "deletedAt" : null,
        "endDate" : "2019-10-04T12:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 273,
          "username" : "User 389",
          "createdAt" : "2016-05-25T11:08:26.152Z",
          "updatedAt" : "2016-05-25T11:08:26.152Z",
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
        "commentsCounter" : 0
      },
      "actor" : {
        "id" : 273,
        "username" : "User 389",
        "createdAt" : "2016-05-25T11:08:26.152Z",
        "updatedAt" : "2016-05-25T11:08:26.152Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  },
  {
    "type" : "Slot",
    "object" : "110",
    "model" : "StdSlotPublic",
    "target" : "110",
    "action" : "create",
    "foreign" : "273",
    "time" : "2016-05-25T11:08:26.171Z",
    "id" : "734268AECEAD2ED1CB32AC37866A11E0AE2C356B",
    "actors" : [
      273
    ],
    "message" : "User 389 creates this Slot.",
    "data" : {
      "target" : {
        "id" : 110,
        "title" : "Slot title 80",
        "startDate" : "2019-09-03T11:44:02.000Z",
        "createdAt" : "2016-05-25T11:08:26.171Z",
        "updatedAt" : "2016-05-25T11:08:26.171Z",
        "deletedAt" : null,
        "endDate" : "2019-10-03T11:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 273,
          "username" : "User 389",
          "createdAt" : "2016-05-25T11:08:26.152Z",
          "updatedAt" : "2016-05-25T11:08:26.152Z",
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
        "commentsCounter" : 0
      },
      "actor" : {
        "id" : 273,
        "username" : "User 389",
        "createdAt" : "2016-05-25T11:08:26.152Z",
        "updatedAt" : "2016-05-25T11:08:26.152Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  },
  {
    "type" : "Slot",
    "object" : "109",
    "model" : "StdSlotPublic",
    "target" : "109",
    "action" : "create",
    "foreign" : "273",
    "time" : "2016-05-25T11:08:26.160Z",
    "id" : "E5F1041C4D6524F4DEB03CC369F0C4BECB4D2FA5",
    "actors" : [
      273
    ],
    "message" : "User 389 creates this Slot.",
    "data" : {
      "target" : {
        "id" : 109,
        "title" : "Slot title 79",
        "startDate" : "2019-09-02T10:44:02.000Z",
        "createdAt" : "2016-05-25T11:08:26.160Z",
        "updatedAt" : "2016-05-25T11:08:26.302Z",
        "deletedAt" : null,
        "endDate" : "2019-10-02T10:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 273,
          "username" : "User 389",
          "createdAt" : "2016-05-25T11:08:26.152Z",
          "updatedAt" : "2016-05-25T11:08:26.152Z",
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
        "commentsCounter" : 2
      },
      "actor" : {
        "id" : 273,
        "username" : "User 389",
        "createdAt" : "2016-05-25T11:08:26.152Z",
        "updatedAt" : "2016-05-25T11:08:26.152Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  }
]
```
