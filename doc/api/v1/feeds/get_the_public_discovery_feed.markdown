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
ETag: W/&quot;443f41bfb9f56a80553af7cd9de7bfb2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8ab26124-c32d-40c4-aa92-75c08468278f
X-Runtime: 0.008260
Content-Length: 4699</pre>

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
      "time" : "2016-08-30T09:50:49.237Z",
      "id" : "9A60092B5EE5B5F1B3E715FF69ACA2074C4A3F1F",
      "message" : "{actor} created the slot group: {group}.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : {
        "id" : "01d4f21a-6cd8-4a56-9b44-0f81bb191373",
        "name" : "Testgroup 123",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-08-30T09:50:49.237Z",
        "updatedAt" : "2016-08-30T09:50:49.237Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.169Z",
        "updatedAt" : "2016-08-30T09:50:49.169Z",
        "deletedAt" : null,
        "image" : ""
      }
    },
    {
      "target" : "slot",
      "action" : "create",
      "time" : "2016-08-30T09:50:49.213Z",
      "id" : "6A32DFF982F8F9C75CC69CE01EA82E52F0387D08",
      "message" : "{actor} creates this Slot.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.213Z",
        "updatedAt" : "2016-08-30T09:50:49.213Z",
        "deletedAt" : null,
        "endDate" : "2019-10-04T12:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.169Z",
        "updatedAt" : "2016-08-30T09:50:49.169Z",
        "deletedAt" : null,
        "image" : ""
      }
    },
    {
      "target" : "slot",
      "action" : "create",
      "time" : "2016-08-30T09:50:49.200Z",
      "id" : "9BE2A9500F5D1D12EE0D20BDC26AC505DCBBEF6A",
      "message" : "{actor} creates this Slot.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.200Z",
        "updatedAt" : "2016-08-30T09:50:49.200Z",
        "deletedAt" : null,
        "endDate" : "2019-10-03T11:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.169Z",
        "updatedAt" : "2016-08-30T09:50:49.169Z",
        "deletedAt" : null,
        "image" : ""
      }
    },
    {
      "target" : "slot",
      "action" : "create",
      "time" : "2016-08-30T09:50:49.180Z",
      "id" : "0BA7F4D7E7B7EE80BDAF86E9EDD623E260694CDA",
      "message" : "{actor} creates this Slot.",
      "actors" : [
        {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.180Z",
        "updatedAt" : "2016-08-30T09:50:49.468Z",
        "deletedAt" : null,
        "endDate" : "2019-10-02T10:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 280,
          "username" : "User 388",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:49.169Z",
          "updatedAt" : "2016-08-30T09:50:49.169Z",
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
        "createdAt" : "2016-08-30T09:50:49.169Z",
        "updatedAt" : "2016-08-30T09:50:49.169Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  ]
}
```
