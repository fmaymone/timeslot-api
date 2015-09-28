# Feeds API

## Get an aggregated activity feed

### GET /v1/feed/news

some extra activity fields are included

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
Authorization: Token token=V3a6_mGWHu9SheFmkuGDUExlkOU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news?style=aggregated</pre>

#### Query Parameters

<pre>style: aggregated</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/feed/news?style=aggregated&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=V3a6_mGWHu9SheFmkuGDUExlkOU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bc2080f26078007919490c7ce2615a39&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7d6f3169-00b5-4be6-81c5-72c4bd05eaef
X-Runtime: 0.003252
Vary: Origin
Content-Length: 2185</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "activities" : [
      {
        "actor" : "53",
        "foreign_id" : "61",
        "id" : "0d580a00-65f3-11e5-8080-80002a923973",
        "message" : "User 53 commented on 'Slot title 22'",
        "object" : "20",
        "origin" : null,
        "slot" : {
          "commentsCounter" : 1,
          "createdAt" : "2015-09-28T15:10:28.819Z",
          "creator" : {
            "createdAt" : "2015-09-28T15:10:28.768Z",
            "deletedAt" : null,
            "id" : 60,
            "image" : {
              "localId" : null,
              "publicId" : null
            },
            "updatedAt" : "2015-09-28T15:10:28.768Z",
            "username" : "User 54"
          },
          "deletedAt" : null,
          "endDate" : "2019-10-23T22:44:02.000Z",
          "id" : 20,
          "likes" : 0,
          "location" : null,
          "media" : [
            {
              "createdAt" : "2015-09-28T15:10:28.889Z",
              "duration" : null,
              "localId" : null,
              "mediaId" : 18,
              "mediaType" : "audio",
              "position" : 5,
              "publicId" : "dfhjghjkdisudgfds7iy16",
              "title" : "Title 15"
            },
            {
              "createdAt" : "2015-09-28T15:10:28.877Z",
              "duration" : null,
              "localId" : null,
              "mediaId" : 17,
              "mediaType" : "video",
              "position" : 4,
              "publicId" : "dfhjghjkdisudgfds7iy15",
              "thumbnail" : null
            },
            {
              "createdAt" : "2015-09-28T15:10:28.865Z",
              "duration" : null,
              "localId" : null,
              "mediaId" : 16,
              "mediaType" : "video",
              "position" : 3,
              "publicId" : "dfhjghjkdisudgfds7iy14",
              "thumbnail" : null
            },
            {
              "createdAt" : "2015-09-28T15:10:28.854Z",
              "localId" : null,
              "mediaId" : 15,
              "mediaType" : "image",
              "position" : 2,
              "publicId" : "dfhjghjkdisudgfds7iy13"
            },
            {
              "createdAt" : "2015-09-28T15:10:28.843Z",
              "localId" : null,
              "mediaId" : 14,
              "mediaType" : "image",
              "position" : 1,
              "publicId" : "dfhjghjkdisudgfds7iy12"
            },
            {
              "createdAt" : "2015-09-28T15:10:28.831Z",
              "localId" : null,
              "mediaId" : 13,
              "mediaType" : "image",
              "position" : 0,
              "publicId" : "dfhjghjkdisudgfds7iy11"
            }
          ],
          "notes" : [],
          "reslotsCounter" : 0,
          "settings" : {
            "alerts" : "0000000000"
          },
          "shareUrl" : null,
          "startDate" : "2019-09-23T22:44:02.000Z",
          "title" : "Slot title 22",
          "updatedAt" : "2015-09-28T15:10:28.819Z",
          "visibility" : "public"
        },
        "target" : null,
        "time" : "2015-09-28T15:10:28.000000",
        "to" : [
          "aggregated:61",
          "notification:61"
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
    "activity_count" : 6,
    "actor_count" : 1,
    "created_at" : "2015-09-28T14:15:23.000000",
    "group" : "11357_2015-09-28",
    "id" : "0d580a00-65f3-11e5-92cb-0a1f1f7e985d",
    "updated_at" : "2015-09-28T15:10:28.000000",
    "verb" : "comment"
  }
]
```
