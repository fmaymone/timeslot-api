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

Name : rrule
Description : Repeating Rule for the slot

Name : openEnd
Description : OpenEnd Boolean Flag

Name : createdAt
Description : Creation of slot

Name : updatedAt
Description : Last update of slot

Name : deletedAt
Description : Delete date of slot or nil

Name : description
Description : Description for the slot

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

Name : firstName
Description : First name of the user

Name : middleName
Description : Middle name of the user

Name : lastName
Description : Last name of the user

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
Authorization: Token token=QW2JkrDCvTj_Y9VBMTpJrpM4rMQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/notification</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/notification&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=QW2JkrDCvTj_Y9VBMTpJrpM4rMQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;ca45fbd71d2df58918ab52927ed7675f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: de90de41-3847-4ea1-8841-089086090f4e
X-Runtime: 0.005986
Content-Length: 2540</pre>

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
      "time" : "2016-12-11T19:54:17.882Z",
      "id" : "F145518DEF711FC094F356AAF488ADFDB1C09F06",
      "message" : "{actor} commented on your Slot: {slot}",
      "actors" : [
        {
          "id" : 275,
          "username" : "User 386",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:17.879Z",
          "updatedAt" : "2016-12-11T19:54:17.879Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 108,
        "title" : "Slot title 23",
        "description" : "",
        "startDate" : "2019-09-01T09:44:02.000Z",
        "rrule" : "",
        "createdAt" : "2016-12-11T19:54:17.850Z",
        "updatedAt" : "2016-12-11T19:54:17.895Z",
        "deletedAt" : null,
        "endDate" : "2019-10-01T09:44:02.000Z",
        "location" : {
          "id" : "24a19f4e-2061-4689-8a02-8a338f920215",
          "name" : "Acapulco",
          "thoroughfare" : null,
          "subThoroughfare" : null,
          "locality" : null,
          "subLocality" : null,
          "administrativeArea" : null,
          "subAdministrativeArea" : null,
          "postalCode" : null,
          "country" : null,
          "isoCountryCode" : null,
          "inLandWater" : null,
          "ocean" : null,
          "areasOfInterest" : null,
          "latitude" : 51.234,
          "longitude" : -11.993,
          "placeId" : null
        },
        "creator" : {
          "id" : 272,
          "username" : "User 382",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:17.830Z",
          "updatedAt" : "2016-12-11T19:54:17.830Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [
          {
            "mediaId" : 468,
            "publicId" : "dfhjghjkdisudgfds7iy381",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-12-11T19:54:17.876Z",
            "duration" : null,
            "title" : "Title 381"
          },
          {
            "mediaId" : 467,
            "publicId" : "dfhjghjkdisudgfds7iy380",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-12-11T19:54:17.874Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 466,
            "publicId" : "dfhjghjkdisudgfds7iy379",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-12-11T19:54:17.871Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 465,
            "publicId" : "dfhjghjkdisudgfds7iy378",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-12-11T19:54:17.868Z"
          },
          {
            "mediaId" : 464,
            "publicId" : "dfhjghjkdisudgfds7iy377",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-12-11T19:54:17.865Z"
          },
          {
            "mediaId" : 463,
            "publicId" : "dfhjghjkdisudgfds7iy376",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-12-11T19:54:17.858Z"
          }
        ],
        "settings" : {
          "alerts" : "omitted"
        },
        "visibility" : "public",
        "likerIds" : [],
        "likes" : 0,
        "commentsCounter" : 1,
        "firstGroup" : null,
        "slotGroupUuids" : []
      },
      "user" : {
        "id" : 272,
        "username" : "User 382",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:17.830Z",
        "updatedAt" : "2016-12-11T19:54:17.830Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  ]
}
```
