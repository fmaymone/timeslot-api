# Feeds API

## Get activity notifications

### GET /v1/feed/notification

some extra activity fields are included

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
Authorization: Token token=gDYpQGvLzLnbkEAfugii-fl4UVo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=gDYpQGvLzLnbkEAfugii-fl4UVo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b95dd6da0941cbdccf806832a6af7465&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1db8e917-5b81-4384-b763-a1a44339809c
X-Runtime: 0.003210
Vary: Origin
Content-Length: 2216</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "activities" : [
      {
        "actor" : "53",
        "foreign_id" : "65",
        "id" : "27451d00-65f2-11e5-8080-800044759cad",
        "message" : "User 53 commented on 'Slot title 23'",
        "object" : "21",
        "origin" : null,
        "slot" : {
          "commentsCounter" : 1,
          "createdAt" : "2015-09-28T15:04:02.051Z",
          "creator" : {
            "createdAt" : "2015-09-28T15:04:02.035Z",
            "deletedAt" : null,
            "id" : 64,
            "image" : {
              "localId" : null,
              "publicId" : null
            },
            "updatedAt" : "2015-09-28T15:04:02.035Z",
            "username" : "User 56"
          },
          "deletedAt" : null,
          "endDate" : "2019-10-24T23:44:02.000Z",
          "id" : 21,
          "likes" : 0,
          "location" : null,
          "media" : [
            {
              "createdAt" : "2015-09-28T15:04:02.075Z",
              "duration" : null,
              "localId" : null,
              "mediaId" : 24,
              "mediaType" : "audio",
              "position" : 5,
              "publicId" : "dfhjghjkdisudgfds7iy22",
              "title" : "Title 21"
            },
            {
              "createdAt" : "2015-09-28T15:04:02.071Z",
              "duration" : null,
              "localId" : null,
              "mediaId" : 23,
              "mediaType" : "video",
              "position" : 4,
              "publicId" : "dfhjghjkdisudgfds7iy21",
              "thumbnail" : null
            },
            {
              "createdAt" : "2015-09-28T15:04:02.067Z",
              "duration" : null,
              "localId" : null,
              "mediaId" : 22,
              "mediaType" : "video",
              "position" : 3,
              "publicId" : "dfhjghjkdisudgfds7iy20",
              "thumbnail" : null
            },
            {
              "createdAt" : "2015-09-28T15:04:02.063Z",
              "localId" : null,
              "mediaId" : 21,
              "mediaType" : "image",
              "position" : 2,
              "publicId" : "dfhjghjkdisudgfds7iy19"
            },
            {
              "createdAt" : "2015-09-28T15:04:02.060Z",
              "localId" : null,
              "mediaId" : 20,
              "mediaType" : "image",
              "position" : 1,
              "publicId" : "dfhjghjkdisudgfds7iy18"
            },
            {
              "createdAt" : "2015-09-28T15:04:02.055Z",
              "localId" : null,
              "mediaId" : 19,
              "mediaType" : "image",
              "position" : 0,
              "publicId" : "dfhjghjkdisudgfds7iy17"
            }
          ],
          "notes" : [],
          "reslotsCounter" : 0,
          "settings" : {
            "alerts" : "0000000000"
          },
          "shareUrl" : null,
          "startDate" : "2019-09-24T23:44:02.000Z",
          "title" : "Slot title 23",
          "updatedAt" : "2015-09-28T15:04:02.051Z",
          "visibility" : "public"
        },
        "target" : null,
        "time" : "2015-09-28T15:04:02.000000",
        "to" : [
          "aggregated:65",
          "notification:65"
        ],
        "user" : {
          "createdAt" : "2015-09-25T21:22:16.257Z",
          "deletedAt" : null,
          "friendsCount" : 0,
          "id" : 53,
          "image" : {
            "localId" : null,
            "publicId" : null
          },
          "reslotCount" : 0,
          "slotCount" : 5,
          "updatedAt" : "2015-09-25T21:22:16.257Z",
          "username" : "User 53"
        },
        "verb" : "comment"
      }
    ],
    "activity_count" : 1,
    "actor_count" : 1,
    "created_at" : "2015-09-28T15:04:02.000000",
    "group" : "11357_2015-09-28",
    "id" : "27451d00-65f2-11e5-8dee-0a23828fb133",
    "is_read" : false,
    "is_seen" : true,
    "updated_at" : "2015-09-28T15:04:02.000000",
    "verb" : "comment"
  }
]
```
