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
Authorization: Token token=ZO_nORmFJoZDVScTHvFOmzS6wVk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ZO_nORmFJoZDVScTHvFOmzS6wVk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2089dd83a8b5994df511c52a7d0e82d6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b0545b5c-5cfd-429a-904e-69ec77e6fe9d
X-Runtime: 0.003617
Vary: Origin
Content-Length: 1996</pre>

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
    "time" : "2015-11-24T23:47:28.961Z",
    "feed" : 3,
    "id" : "150D4B3805701047EC942B0A6478F12591113F18",
    "actors" : [
      8
    ],
    "data" : {
      "target" : {
        "id" : 3,
        "title" : "Slot title 23",
        "startDate" : "2019-09-24T23:44:02.000Z",
        "createdAt" : "2015-11-24T23:47:28.939Z",
        "updatedAt" : "2015-11-24T23:47:28.939Z",
        "deletedAt" : null,
        "endDate" : "2019-10-24T23:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 9,
          "username" : "User 60",
          "createdAt" : "2015-11-24T23:47:28.929Z",
          "updatedAt" : "2015-11-24T23:47:28.929Z",
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
        "media" : [
          {
            "mediaId" : 18,
            "publicId" : "dfhjghjkdisudgfds7iy21",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2015-11-24T23:47:28.957Z",
            "duration" : null,
            "title" : "Title 21"
          },
          {
            "mediaId" : 17,
            "publicId" : "dfhjghjkdisudgfds7iy20",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2015-11-24T23:47:28.953Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 16,
            "publicId" : "dfhjghjkdisudgfds7iy19",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2015-11-24T23:47:28.950Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 15,
            "publicId" : "dfhjghjkdisudgfds7iy18",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-11-24T23:47:28.948Z"
          },
          {
            "mediaId" : 14,
            "publicId" : "dfhjghjkdisudgfds7iy17",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-11-24T23:47:28.945Z"
          },
          {
            "mediaId" : 13,
            "publicId" : "dfhjghjkdisudgfds7iy16",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-11-24T23:47:28.942Z"
          }
        ],
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
        "createdAt" : "2015-11-24T23:47:28.923Z",
        "updatedAt" : "2015-11-24T23:47:28.923Z",
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
