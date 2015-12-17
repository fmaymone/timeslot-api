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
Authorization: Token token=dz63YCPFNpgSA7B6iqEcOqo0k60
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dz63YCPFNpgSA7B6iqEcOqo0k60&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1fbc56d624df8918e3cc40d03ae7d3f1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 18df7513-c5b1-4b24-8b47-f86c26ed974b
X-Runtime: 0.015802
Vary: Origin
Content-Length: 1903</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "1",
    "action" : "comment",
    "time" : "2015-12-15T22:42:02.965Z",
    "id" : "94E1610FBA8A7E8314A847FDA65F697351F582BD",
    "actors" : [
      3
    ],
    "message" : "You commented on the Slot: Slot title 21",
    "data" : {
      "target" : {
        "id" : 1,
        "title" : "Slot title 21",
        "startDate" : "2019-09-22T21:44:02.000Z",
        "createdAt" : "2015-12-15T22:42:02.932Z",
        "updatedAt" : "2015-12-15T22:42:02.975Z",
        "deletedAt" : null,
        "endDate" : "2019-10-22T21:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 1,
          "username" : "User 55",
          "createdAt" : "2015-12-15T22:42:02.916Z",
          "updatedAt" : "2015-12-15T22:42:02.916Z",
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
            "mediaId" : 6,
            "publicId" : "dfhjghjkdisudgfds7iy9",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2015-12-15T22:42:02.956Z",
            "duration" : null,
            "title" : "Title 9"
          },
          {
            "mediaId" : 5,
            "publicId" : "dfhjghjkdisudgfds7iy8",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2015-12-15T22:42:02.952Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 4,
            "publicId" : "dfhjghjkdisudgfds7iy7",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2015-12-15T22:42:02.949Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 3,
            "publicId" : "dfhjghjkdisudgfds7iy6",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-12-15T22:42:02.945Z"
          },
          {
            "mediaId" : 2,
            "publicId" : "dfhjghjkdisudgfds7iy5",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-12-15T22:42:02.941Z"
          },
          {
            "mediaId" : 1,
            "publicId" : "dfhjghjkdisudgfds7iy4",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-12-15T22:42:02.937Z"
          }
        ],
        "reslotsCounter" : 0,
        "visibility" : "public",
        "likes" : 0,
        "commentsCounter" : 1,
        "shareUrl" : null
      },
      "actor" : {
        "id" : 3,
        "username" : "User 57",
        "createdAt" : "2015-12-15T22:42:02.960Z",
        "updatedAt" : "2015-12-15T22:42:02.960Z",
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
