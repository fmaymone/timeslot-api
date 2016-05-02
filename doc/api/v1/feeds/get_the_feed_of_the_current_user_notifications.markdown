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
Authorization: Token token=2rWzcIOFjIU4Xx9XOWYa1ZPcnVk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=2rWzcIOFjIU4Xx9XOWYa1ZPcnVk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;420181206f18bd36731b906e1e79004d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 37b8fb7e-c6dc-44dd-84d4-b5a0ae268a4b
X-Runtime: 0.005277
Content-Length: 1788</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "103",
    "action" : "comment",
    "time" : "2016-05-01T22:54:07.878Z",
    "id" : "36D8CA9A0D7160D625E113208E36A234A53EB2E7",
    "actors" : [
      90
    ],
    "message" : "User 206 commented on your Slot: Slot title 23",
    "data" : {
      "target" : {
        "id" : 103,
        "title" : "Slot title 23",
        "startDate" : "2019-09-01T09:44:02.000Z",
        "createdAt" : "2016-05-01T22:54:07.850Z",
        "updatedAt" : "2016-05-01T22:54:07.881Z",
        "deletedAt" : null,
        "endDate" : "2019-10-01T09:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 88,
          "username" : "User 203",
          "createdAt" : "2016-05-01T22:54:07.839Z",
          "updatedAt" : "2016-05-01T22:54:07.839Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [
          {
            "mediaId" : 18,
            "publicId" : "dfhjghjkdisudgfds7iy21",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-05-01T22:54:07.870Z",
            "duration" : null,
            "title" : "Title 21"
          },
          {
            "mediaId" : 17,
            "publicId" : "dfhjghjkdisudgfds7iy20",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-05-01T22:54:07.865Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 16,
            "publicId" : "dfhjghjkdisudgfds7iy19",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-05-01T22:54:07.862Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 15,
            "publicId" : "dfhjghjkdisudgfds7iy18",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-01T22:54:07.859Z"
          },
          {
            "mediaId" : 14,
            "publicId" : "dfhjghjkdisudgfds7iy17",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-01T22:54:07.857Z"
          },
          {
            "mediaId" : 13,
            "publicId" : "dfhjghjkdisudgfds7iy16",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-01T22:54:07.854Z"
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
        "id" : 90,
        "username" : "User 206",
        "createdAt" : "2016-05-01T22:54:07.875Z",
        "updatedAt" : "2016-05-01T22:54:07.875Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  }
]
```
