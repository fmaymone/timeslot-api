# Feeds API

## Get the feed of the current users activities

### GET /v1/feed/user

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

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=fIzH762qCEq2itHJFQbdhz6nKas
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=fIzH762qCEq2itHJFQbdhz6nKas&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1a7fab0337bb150875b12962bd7a8ed7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b5baf5a6-3e33-45ee-986d-2cf172ad8a54
X-Runtime: 0.012046
Vary: Origin
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "object" : "1",
    "target" : "1",
    "activity" : "comment",
    "foreignId" : "1",
    "time" : "2015-10-30T15:01:01.028Z",
    "feed" : 3,
    "id" : "81EDF3418054DF3A564C0FA7AECE594EF9912E14",
    "actors" : [
      "3"
    ],
    "data" : {
      "target" : {
        "id" : 1,
        "title" : "Slot title 21",
        "startDate" : "2019-09-21T20:44:02.000Z",
        "createdAt" : "2015-10-30T15:01:00.753Z",
        "updatedAt" : "2015-10-30T15:01:00.753Z",
        "deletedAt" : null,
        "endDate" : "2019-10-21T20:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 1,
          "username" : "User 54",
          "createdAt" : "2015-10-30T15:01:00.726Z",
          "updatedAt" : "2015-10-30T15:01:00.726Z",
          "deletedAt" : null,
          "image" : {
            "publicId" : null,
            "localId" : null
          },
          "slotCount" : 1,
          "reslotCount" : 0,
          "friendsCount" : 0
        },
        "notes" : [],
        "media" : [],
        "reslotsCounter" : 0,
        "visibility" : "public",
        "settings" : {
          "alerts" : "0000000000"
        },
        "likes" : 0,
        "commentsCounter" : 1,
        "shareUrl" : null
      },
      "actor" : {
        "id" : 3,
        "username" : "User 58",
        "createdAt" : "2015-10-30T15:01:01.025Z",
        "updatedAt" : "2015-10-30T15:01:01.025Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        },
        "slotCount" : 1,
        "reslotCount" : 0,
        "friendsCount" : 0
      }
    },
    "message" : "You commented on the Slot: Slot title 21"
  }
]
```
