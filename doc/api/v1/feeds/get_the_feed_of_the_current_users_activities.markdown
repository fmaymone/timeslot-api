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
Authorization: Token token=w-BH5ow7iXKSV2IUjvCKlGB33_k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=w-BH5ow7iXKSV2IUjvCKlGB33_k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0440632d855c6ebe74fe40ac99236fb1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2c37fbcb-33aa-4f2b-9a98-8ee5f8c96f2c
X-Runtime: 0.011609
Content-Length: 1815</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "cursor" : 0,
  "next" : null,
  "prev" : null,
  "results" : [
    {
      "target" : "slot",
      "action" : "comment",
      "time" : "2016-05-25T10:47:37.505Z",
      "id" : "043D15FEE97BCAB7BE1CAF4AA345E846DB7B345D",
      "message" : "You commented on the Slot: {slot}",
      "actors" : [
        {
          "id" : 265,
          "username" : "User 379",
          "createdAt" : "2016-05-25T10:47:37.501Z",
          "updatedAt" : "2016-05-25T10:47:37.501Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 106,
        "title" : "Slot title 21",
        "startDate" : "2019-09-26T07:44:02.000Z",
        "createdAt" : "2016-05-25T10:47:37.481Z",
        "updatedAt" : "2016-05-25T10:47:37.511Z",
        "deletedAt" : null,
        "endDate" : "2019-10-26T07:44:02.000Z",
        "location" : null,
        "creator" : {
          "id" : 263,
          "username" : "User 376",
          "createdAt" : "2016-05-25T10:47:37.472Z",
          "updatedAt" : "2016-05-25T10:47:37.472Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [
          {
            "mediaId" : 456,
            "publicId" : "dfhjghjkdisudgfds7iy369",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-05-25T10:47:37.499Z",
            "duration" : null,
            "title" : "Title 369"
          },
          {
            "mediaId" : 455,
            "publicId" : "dfhjghjkdisudgfds7iy368",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-05-25T10:47:37.497Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 454,
            "publicId" : "dfhjghjkdisudgfds7iy367",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-05-25T10:47:37.495Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 453,
            "publicId" : "dfhjghjkdisudgfds7iy366",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-25T10:47:37.492Z"
          },
          {
            "mediaId" : 452,
            "publicId" : "dfhjghjkdisudgfds7iy365",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-25T10:47:37.490Z"
          },
          {
            "mediaId" : 451,
            "publicId" : "dfhjghjkdisudgfds7iy364",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-05-25T10:47:37.487Z"
          }
        ],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likerIds" : [],
        "likes" : 0,
        "commentsCounter" : 1
      }
    }
  ]
}
```
