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
Authorization: Token token=cGW3m9QrGh_KEwK_k8EoZaGMwlk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/news&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=cGW3m9QrGh_KEwK_k8EoZaGMwlk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0022cdc174e042e264a087aa5112ca79&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 06866ba0-34e0-426a-b68d-89c9e0405a3d
X-Runtime: 0.005902
Vary: Origin
Content-Length: 1778</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "2",
    "action" : "comment",
    "time" : "2016-04-04T20:50:21.169Z",
    "id" : "7C56142B288100A23EC4A8B4A55FAD5E7762E6ED",
    "actors" : [
      7
    ],
    "activityCount" : 1,
    "cursor" : "1",
    "message" : "User 57 commented on this Slot.",
    "data" : {
      "target" : {
        "id" : 2,
        "title" : "Slot title 22",
        "startDate" : "2019-09-21T20:44:02.000Z",
        "createdAt" : "2016-04-04T20:50:21.125Z",
        "updatedAt" : "2016-04-04T20:50:21.174Z",
        "deletedAt" : null,
        "endDate" : "2019-10-21T20:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 5,
          "username" : "User 55",
          "createdAt" : "2016-04-04T20:50:21.117Z",
          "updatedAt" : "2016-04-04T20:50:21.117Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [
          {
            "mediaId" : 12,
            "publicId" : "dfhjghjkdisudgfds7iy15",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-04-04T20:50:21.158Z",
            "duration" : null,
            "title" : "Title 15"
          },
          {
            "mediaId" : 11,
            "publicId" : "dfhjghjkdisudgfds7iy14",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-04-04T20:50:21.156Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 10,
            "publicId" : "dfhjghjkdisudgfds7iy13",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-04-04T20:50:21.153Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 9,
            "publicId" : "dfhjghjkdisudgfds7iy12",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-04-04T20:50:21.149Z"
          },
          {
            "mediaId" : 8,
            "publicId" : "dfhjghjkdisudgfds7iy11",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-04-04T20:50:21.146Z"
          },
          {
            "mediaId" : 7,
            "publicId" : "dfhjghjkdisudgfds7iy10",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-04-04T20:50:21.143Z"
          }
        ],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likes" : 0,
        "commentsCounter" : 1
      },
      "actor" : {
        "id" : 7,
        "username" : "User 57",
        "createdAt" : "2016-04-04T20:50:21.161Z",
        "updatedAt" : "2016-04-04T20:50:21.161Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  }
]
```
