# Feeds API

## Get an aggregated activity feed

### GET /v1/feed/news

some extra activity fields are included

### Parameters

Name : style
Description : Style of the news activity feed (&#39;flat&#39; or &#39;aggregated&#39;)

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
Authorization: Token token=6A-P1MoRIwGpQbZ0Zzb7HowG-7k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/news&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=6A-P1MoRIwGpQbZ0Zzb7HowG-7k&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3137e2c67103dd8f90c3e2bc7df2fb50&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8e0d2410-26a1-4f7a-a5c8-7174edb23b8f
X-Runtime: 0.006040
Vary: Origin
Content-Length: 1190</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "object" : 3,
    "target" : "19",
    "activity" : "comment",
    "message" : "User 53 commented on: Slot title 22",
    "foreignId" : "85",
    "time" : "2015-10-14T23:34:25.654Z",
    "slot" : {
      "id" : 19,
      "title" : "Slot title 22",
      "startDate" : "2019-09-22T21:44:02.000Z",
      "createdAt" : "2015-10-14T23:34:25.387Z",
      "updatedAt" : "2015-10-14T23:34:25.387Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 85,
        "username" : "User 59",
        "createdAt" : "2015-10-14T23:34:25.375Z",
        "updatedAt" : "2015-10-14T23:34:25.375Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [
        {
          "mediaId" : 13,
          "publicId" : "dfhjghjkdisudgfds7iy11",
          "position" : 0,
          "localId" : null,
          "mediaType" : "image",
          "createdAt" : "2015-10-14T23:34:25.392Z"
        }
      ],
      "settings" : {
        "alerts" : "0000000000"
      },
      "visibility" : "public",
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 1,
      "shareUrl" : null
    },
    "user" : {
      "id" : 84,
      "username" : "User 53",
      "createdAt" : "2015-10-14T23:34:25.369Z",
      "updatedAt" : "2015-10-14T23:34:25.369Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      },
      "slotCount" : 1,
      "reslotCount" : 0,
      "friendsCount" : 0
    },
    "id" : "7870DE11951902155324A87B2EB98C9BB1D115CB",
    "group" : "19comment20151014",
    "actors" : [
      84
    ],
    "activityCount" : 1,
    "cursor" : "1"
  }
]
```
