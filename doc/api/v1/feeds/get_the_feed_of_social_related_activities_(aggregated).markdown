# Feeds API

## Get the feed of social related activities (aggregated)

### GET /v1/feed/news

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
Authorization: Token token=T1ak2OULIWn-de4r3Ti9_H3DeEc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/news&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=T1ak2OULIWn-de4r3Ti9_H3DeEc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8c03c7ac8c084f6d6700b5966f4b1ddc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2418fd51-4e21-4f84-affb-a219e472de5f
X-Runtime: 0.005058
Vary: Origin
Content-Length: 1919</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "2",
    "action" : "comment",
    "time" : "2016-01-29T19:38:54.213Z",
    "id" : "EC416B7F4D48B034E67D60FFE129AA267BD4924E",
    "actors" : [
      7
    ],
    "activityCount" : 1,
    "cursor" : "1",
    "message" : "User 74 commented on this Slot.",
    "data" : {
      "target" : {
        "id" : 2,
        "title" : "Slot title 22",
        "startDate" : "2019-09-03T05:44:02.000Z",
        "createdAt" : "2016-01-29T19:38:54.182Z",
        "updatedAt" : "2016-01-29T19:38:54.219Z",
        "deletedAt" : null,
        "endDate" : "2019-10-03T05:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 5,
          "username" : "User 72",
          "createdAt" : "2016-01-29T19:38:54.169Z",
          "updatedAt" : "2016-01-29T19:38:54.169Z",
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
            "mediaId" : 12,
            "publicId" : "dfhjghjkdisudgfds7iy15",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-01-29T19:38:54.204Z",
            "duration" : null,
            "title" : "Title 15"
          },
          {
            "mediaId" : 11,
            "publicId" : "dfhjghjkdisudgfds7iy14",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-01-29T19:38:54.200Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 10,
            "publicId" : "dfhjghjkdisudgfds7iy13",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-01-29T19:38:54.197Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 9,
            "publicId" : "dfhjghjkdisudgfds7iy12",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-01-29T19:38:54.194Z"
          },
          {
            "mediaId" : 8,
            "publicId" : "dfhjghjkdisudgfds7iy11",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-01-29T19:38:54.190Z"
          },
          {
            "mediaId" : 7,
            "publicId" : "dfhjghjkdisudgfds7iy10",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-01-29T19:38:54.186Z"
          }
        ],
        "reslotsCounter" : 0,
        "visibility" : "public",
        "likes" : 0,
        "commentsCounter" : 1
      },
      "actor" : {
        "id" : 7,
        "username" : "User 74",
        "createdAt" : "2016-01-29T19:38:54.208Z",
        "updatedAt" : "2016-01-29T19:38:54.208Z",
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
