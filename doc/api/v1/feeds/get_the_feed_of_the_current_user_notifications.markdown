# Feeds API

## Get the feed of the current user notifications

### GET /v1/feed/notification

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
Authorization: Token token=_lh3wRuAMzkuJIej1TcVAP8_6Z0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_lh3wRuAMzkuJIej1TcVAP8_6Z0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c6166f82e551775a41e3bf8766ef3aaf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 81052346-0f19-4f48-b9c4-b257100444d7
X-Runtime: 0.003217
Vary: Origin
Content-Length: 1070</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "object" : "3",
    "target" : "3",
    "activity" : "comment",
    "foreignId" : "9",
    "time" : "2015-10-30T15:01:01.575Z",
    "feed" : 3,
    "id" : "051057C24A70A1D4E6AC5170C943FECDCB84B29A",
    "actors" : [
      "8"
    ],
    "data" : {
      "target" : {
        "id" : 3,
        "title" : "Slot title 23",
        "startDate" : "2019-09-23T22:44:02.000Z",
        "createdAt" : "2015-10-30T15:01:01.389Z",
        "updatedAt" : "2015-10-30T15:01:01.389Z",
        "deletedAt" : null,
        "endDate" : "2019-10-23T22:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 9,
          "username" : "User 62",
          "createdAt" : "2015-10-30T15:01:01.379Z",
          "updatedAt" : "2015-10-30T15:01:01.379Z",
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
        "id" : 8,
        "username" : "User 53",
        "createdAt" : "2015-10-30T15:01:01.374Z",
        "updatedAt" : "2015-10-30T15:01:01.374Z",
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
    "message" : "User 53 commented on your Slot: Slot title 23"
  }
]
```
