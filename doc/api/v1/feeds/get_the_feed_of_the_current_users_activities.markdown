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
Authorization: Token token=Qw_aXQlLPZAVmnWY1Qh3mu4teaI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Qw_aXQlLPZAVmnWY1Qh3mu4teaI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e0963d20276b3fad7f5fa490574974c6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4fdb2e1d-b384-4ba1-9310-efdec6a0ab18
X-Runtime: 0.018862
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
    "time" : "2015-12-23T11:18:29.546Z",
    "id" : "FCDFD765B952D95DB5168B5F92437CE1221C0A75",
    "actors" : [
      3
    ],
    "message" : "You commented on the Slot: Slot title 21",
    "data" : {
      "target" : {
        "id" : 1,
        "title" : "Slot title 21",
        "startDate" : "2019-09-23T22:44:02.000Z",
        "createdAt" : "2015-12-23T11:18:29.508Z",
        "updatedAt" : "2015-12-23T11:18:29.553Z",
        "deletedAt" : null,
        "endDate" : "2019-10-23T22:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 1,
          "username" : "User 56",
          "createdAt" : "2015-12-23T11:18:29.492Z",
          "updatedAt" : "2015-12-23T11:18:29.492Z",
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
            "createdAt" : "2015-12-23T11:18:29.534Z",
            "duration" : null,
            "title" : "Title 9"
          },
          {
            "mediaId" : 5,
            "publicId" : "dfhjghjkdisudgfds7iy8",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2015-12-23T11:18:29.529Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 4,
            "publicId" : "dfhjghjkdisudgfds7iy7",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2015-12-23T11:18:29.525Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 3,
            "publicId" : "dfhjghjkdisudgfds7iy6",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-12-23T11:18:29.520Z"
          },
          {
            "mediaId" : 2,
            "publicId" : "dfhjghjkdisudgfds7iy5",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-12-23T11:18:29.517Z"
          },
          {
            "mediaId" : 1,
            "publicId" : "dfhjghjkdisudgfds7iy4",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2015-12-23T11:18:29.513Z"
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
        "username" : "User 58",
        "createdAt" : "2015-12-23T11:18:29.538Z",
        "updatedAt" : "2015-12-23T11:18:29.538Z",
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
