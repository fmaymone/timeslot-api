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
Authorization: Token token=SGPbJ3Fvy8wfGTVGlzDJzkKhshg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=SGPbJ3Fvy8wfGTVGlzDJzkKhshg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;388f7bbaaacdd77cdca9dade93d4569c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b68c2dba-7b5c-4ecf-bc03-5ce65e10c0c0
X-Runtime: 0.015506
Vary: Origin
Content-Length: 1746</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "type" : "Slot",
    "target" : "1",
    "action" : "comment",
    "time" : "2016-04-04T20:50:20.986Z",
    "id" : "BC708194474B0F59043E34673D7141508D7614FF",
    "actors" : [
      3
    ],
    "message" : "You commented on the Slot: Slot title 21",
    "data" : {
      "target" : {
        "id" : 1,
        "title" : "Slot title 21",
        "startDate" : "2019-09-20T19:44:02.000Z",
        "createdAt" : "2016-04-04T20:50:20.955Z",
        "updatedAt" : "2016-04-04T20:50:20.991Z",
        "deletedAt" : null,
        "endDate" : "2019-10-20T19:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 1,
          "username" : "User 51",
          "createdAt" : "2016-04-04T20:50:20.926Z",
          "updatedAt" : "2016-04-04T20:50:20.926Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [
          {
            "mediaId" : 6,
            "publicId" : "dfhjghjkdisudgfds7iy9",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-04-04T20:50:20.980Z",
            "duration" : null,
            "title" : "Title 9"
          },
          {
            "mediaId" : 5,
            "publicId" : "dfhjghjkdisudgfds7iy8",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-04-04T20:50:20.977Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 4,
            "publicId" : "dfhjghjkdisudgfds7iy7",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-04-04T20:50:20.975Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 3,
            "publicId" : "dfhjghjkdisudgfds7iy6",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-04-04T20:50:20.969Z"
          },
          {
            "mediaId" : 2,
            "publicId" : "dfhjghjkdisudgfds7iy5",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-04-04T20:50:20.964Z"
          },
          {
            "mediaId" : 1,
            "publicId" : "dfhjghjkdisudgfds7iy4",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-04-04T20:50:20.959Z"
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
        "id" : 3,
        "username" : "User 53",
        "createdAt" : "2016-04-04T20:50:20.982Z",
        "updatedAt" : "2016-04-04T20:50:20.982Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  }
]
```
