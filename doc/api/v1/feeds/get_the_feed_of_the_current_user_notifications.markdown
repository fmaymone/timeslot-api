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
Authorization: Token token=PPF7wHl8sTk1Svcc7fLgw8HT-vY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=PPF7wHl8sTk1Svcc7fLgw8HT-vY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0146718ad2903b9df876b698e1df576e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 19dc0dfa-959d-46f7-b712-4e6f9f94b96a
X-Runtime: 0.005825
Vary: Origin
Content-Length: 1907</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "3",
    "action" : "comment",
    "time" : "2016-01-29T19:38:54.318Z",
    "id" : "5A1136CAE716F4B0664BE7E72858E37CEE8215F5",
    "actors" : [
      10
    ],
    "message" : "User 77 commented on your Slot: Slot title 23",
    "data" : {
      "target" : {
        "id" : 3,
        "title" : "Slot title 23",
        "startDate" : "2019-09-04T06:44:02.000Z",
        "createdAt" : "2016-01-29T19:38:54.287Z",
        "updatedAt" : "2016-01-29T19:38:54.323Z",
        "deletedAt" : null,
        "endDate" : "2019-10-04T06:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 8,
          "username" : "User 75",
          "createdAt" : "2016-01-29T19:38:54.275Z",
          "updatedAt" : "2016-01-29T19:38:54.275Z",
          "deletedAt" : null,
          "image" : {
            "publicId" : null,
            "localId" : null
          },
          "slotCount" : 0,
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
            "createdAt" : "2016-01-29T19:38:54.309Z",
            "duration" : null,
            "title" : "Title 21"
          },
          {
            "mediaId" : 17,
            "publicId" : "dfhjghjkdisudgfds7iy20",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-01-29T19:38:54.306Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 16,
            "publicId" : "dfhjghjkdisudgfds7iy19",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-01-29T19:38:54.302Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 15,
            "publicId" : "dfhjghjkdisudgfds7iy18",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-01-29T19:38:54.299Z"
          },
          {
            "mediaId" : 14,
            "publicId" : "dfhjghjkdisudgfds7iy17",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-01-29T19:38:54.295Z"
          },
          {
            "mediaId" : 13,
            "publicId" : "dfhjghjkdisudgfds7iy16",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-01-29T19:38:54.291Z"
          }
        ],
        "reslotsCounter" : 0,
        "visibility" : "public",
        "likes" : 0,
        "commentsCounter" : 1
      },
      "actor" : {
        "id" : 10,
        "username" : "User 77",
        "createdAt" : "2016-01-29T19:38:54.313Z",
        "updatedAt" : "2016-01-29T19:38:54.313Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        },
        "slotCount" : 0,
        "reslotCount" : 0,
        "friendsCount" : 0
      }
    }
  }
]
```
