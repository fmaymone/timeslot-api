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
Authorization: Token token=I6xhFQmcpGGTvqg0yqIoC7fioNo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/news&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=I6xhFQmcpGGTvqg0yqIoC7fioNo&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c1e97e2719e65e6498ed59fb901e417f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 541f14d6-fd78-4851-929a-45222bc34665
X-Runtime: 0.004740
Content-Length: 1802</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "102",
    "action" : "comment",
    "time" : "2016-05-01T22:54:07.786Z",
    "id" : "D13F741E22020FF1ACF474B09B7D42DD8F225954",
    "actors" : [
      87
    ],
    "activityCount" : 1,
    "cursor" : "1",
    "message" : "User 202 commented on this Slot.",
    "data" : {
      "target" : {
        "id" : 102,
        "title" : "Slot title 22",
        "startDate" : "2019-09-27T08:44:02.000Z",
        "createdAt" : "2016-05-01T22:54:07.762Z",
        "updatedAt" : "2016-05-01T22:54:07.790Z",
        "deletedAt" : null,
        "endDate" : "2019-10-27T08:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 85,
          "username" : "User 199",
          "createdAt" : "2016-05-01T22:54:07.752Z",
          "updatedAt" : "2016-05-01T22:54:07.752Z",
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
            "createdAt" : "2016-05-01T22:54:07.779Z",
            "duration" : null,
            "title" : "Title 15"
          },
          {
            "mediaId" : 11,
            "publicId" : "dfhjghjkdisudgfds7iy14",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-05-01T22:54:07.776Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 10,
            "publicId" : "dfhjghjkdisudgfds7iy13",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-05-01T22:54:07.773Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 9,
            "publicId" : "dfhjghjkdisudgfds7iy12",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-01T22:54:07.771Z"
          },
          {
            "mediaId" : 8,
            "publicId" : "dfhjghjkdisudgfds7iy11",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-01T22:54:07.768Z"
          },
          {
            "mediaId" : 7,
            "publicId" : "dfhjghjkdisudgfds7iy10",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-01T22:54:07.766Z"
          }
        ],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likerIds" : [],
        "likes" : 0,
        "commentsCounter" : 1
      },
      "actor" : {
        "id" : 87,
        "username" : "User 202",
        "createdAt" : "2016-05-01T22:54:07.782Z",
        "updatedAt" : "2016-05-01T22:54:07.782Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  }
]
```
