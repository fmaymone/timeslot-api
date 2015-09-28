# Feeds API

## Get activity feed for the current user

### GET /v1/feed/user

if a user is authenticated, then some extraactivity fields are included

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
Authorization: Token token=M6f1YjeSzFwM6c6xsux8EsVf-Ig
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=M6f1YjeSzFwM6c6xsux8EsVf-Ig&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aa325a42c8f869f935e414b7beccafb1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a266da57-4db1-4aac-ae79-634adefa5ffa
X-Runtime: 0.012343
Vary: Origin
Content-Length: 2986</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "actor" : "53",
    "foreign_id" : "54",
    "id" : "0cbf7380-65f3-11e5-8080-80006cf73f47",
    "message" : "User 53 commented on 'Slot title 21'",
    "object" : "19",
    "origin" : null,
    "slot" : {
      "commentsCounter" : 1,
      "createdAt" : "2015-09-28T15:10:26.843Z",
      "creator" : {
        "createdAt" : "2015-09-28T15:10:26.684Z",
        "deletedAt" : null,
        "id" : 56,
        "image" : {
          "localId" : null,
          "publicId" : null
        },
        "updatedAt" : "2015-09-28T15:10:26.684Z",
        "username" : "User 52"
      },
      "deletedAt" : null,
      "endDate" : "2019-10-22T21:44:02.000Z",
      "id" : 19,
      "likes" : 0,
      "location" : null,
      "media" : [
        {
          "createdAt" : "2015-09-28T15:10:26.916Z",
          "duration" : null,
          "localId" : null,
          "mediaId" : 12,
          "mediaType" : "audio",
          "position" : 5,
          "publicId" : "dfhjghjkdisudgfds7iy10",
          "title" : "Title 9"
        },
        {
          "createdAt" : "2015-09-28T15:10:26.904Z",
          "duration" : null,
          "localId" : null,
          "mediaId" : 11,
          "mediaType" : "video",
          "position" : 4,
          "publicId" : "dfhjghjkdisudgfds7iy9",
          "thumbnail" : null
        },
        {
          "createdAt" : "2015-09-28T15:10:26.893Z",
          "duration" : null,
          "localId" : null,
          "mediaId" : 10,
          "mediaType" : "video",
          "position" : 3,
          "publicId" : "dfhjghjkdisudgfds7iy8",
          "thumbnail" : null
        },
        {
          "createdAt" : "2015-09-28T15:10:26.881Z",
          "localId" : null,
          "mediaId" : 9,
          "mediaType" : "image",
          "position" : 2,
          "publicId" : "dfhjghjkdisudgfds7iy7"
        },
        {
          "createdAt" : "2015-09-28T15:10:26.868Z",
          "localId" : null,
          "mediaId" : 8,
          "mediaType" : "image",
          "position" : 1,
          "publicId" : "dfhjghjkdisudgfds7iy6"
        },
        {
          "createdAt" : "2015-09-28T15:10:26.856Z",
          "localId" : null,
          "mediaId" : 7,
          "mediaType" : "image",
          "position" : 0,
          "publicId" : "dfhjghjkdisudgfds7iy5"
        }
      ],
      "notes" : [],
      "reslotsCounter" : 0,
      "settings" : {
        "alerts" : "0000000000"
      },
      "shareUrl" : null,
      "startDate" : "2019-09-22T21:44:02.000Z",
      "title" : "Slot title 21",
      "updatedAt" : "2015-09-28T15:10:26.843Z",
      "visibility" : "public"
    },
    "target" : null,
    "time" : "2015-09-28T15:10:27.000000",
    "to" : [
      "aggregated:54",
      "notification:54"
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
  },
  {
    "actor" : "53",
    "foreign_id" : "54",
    "id" : "aeaa8480-6622-11e5-8080-80001044bbff",
    "message" : "User 53 likes your slot",
    "object" : "19",
    "origin" : null,
    "slot" : {
      "commentsCounter" : 353,
      "createdAt" : "2015-08-30T19:40:39.342Z",
      "creator" : {
        "createdAt" : "2015-08-30T19:40:36.540Z",
        "deletedAt" : null,
        "id" : 56,
        "image" : {
          "localId" : null,
          "publicId" : null
        },
        "updatedAt" : "2015-08-30T19:40:36.540Z",
        "username" : "User 52"
      },
      "deletedAt" : null,
      "endDate" : "2019-10-20T16:44:02.000Z",
      "id" : 19,
      "likes" : 1,
      "location" : null,
      "media" : [],
      "notes" : [],
      "reslotsCounter" : 0,
      "settings" : {
        "alerts" : "0000000000"
      },
      "shareUrl" : null,
      "startDate" : "2019-09-20T16:44:02.000Z",
      "title" : "National Creative Planner Jr.",
      "updatedAt" : "2015-08-30T19:40:39.342Z",
      "visibility" : "public"
    },
    "target" : null,
    "time" : "2015-09-28T20:51:25.000000",
    "to" : [
      "aggregated:54",
      "notification:54"
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
    "verb" : "like"
  }
]
```
