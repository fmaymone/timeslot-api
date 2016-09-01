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
Authorization: Token token=dy6iRAsNqNeQm0AFzTQeJn-tMvU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/news&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dy6iRAsNqNeQm0AFzTQeJn-tMvU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;19a54a202584235060aef232abbc2b63&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6e48aad4-47a8-4c3b-9fdb-55d546fbe6dd
X-Runtime: 0.005468
Content-Length: 2536</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "cursor" : "0",
  "next" : "1",
  "prev" : null,
  "results" : [
    {
      "target" : "slot",
      "action" : "comment",
      "time" : "2016-08-30T09:50:48.779Z",
      "id" : "939FBC0E59837BB9ED51437A907A9889D4911F4A",
      "message" : "{actor} commented on this Slot.",
      "cursor" : "1",
      "actors" : [
        {
          "id" : 271,
          "username" : "User 381",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.775Z",
          "updatedAt" : "2016-08-30T09:50:48.775Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 107,
        "title" : "Slot title 22",
        "description" : "",
        "startDate" : "2019-09-27T08:44:02.000Z",
        "createdAt" : "2016-08-30T09:50:48.746Z",
        "updatedAt" : "2016-08-30T09:50:48.785Z",
        "deletedAt" : null,
        "endDate" : "2019-10-27T08:44:02.000Z",
        "location" : {
          "id" : "88f9c050-c6d0-4373-ad55-551079f38def",
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
          "id" : 268,
          "username" : "User 377",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.719Z",
          "updatedAt" : "2016-08-30T09:50:48.719Z",
          "deletedAt" : null,
          "image" : ""
        },
        "notes" : [],
        "media" : [
          {
            "mediaId" : 462,
            "publicId" : "dfhjghjkdisudgfds7iy375",
            "position" : 5,
            "localId" : null,
            "mediaType" : "audio",
            "createdAt" : "2016-08-30T09:50:48.772Z",
            "duration" : null,
            "title" : "Title 375"
          },
          {
            "mediaId" : 461,
            "publicId" : "dfhjghjkdisudgfds7iy374",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-08-30T09:50:48.769Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 460,
            "publicId" : "dfhjghjkdisudgfds7iy373",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-08-30T09:50:48.767Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 459,
            "publicId" : "dfhjghjkdisudgfds7iy372",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-08-30T09:50:48.765Z"
          },
          {
            "mediaId" : 458,
            "publicId" : "dfhjghjkdisudgfds7iy371",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-08-30T09:50:48.762Z"
          },
          {
            "mediaId" : 457,
            "publicId" : "dfhjghjkdisudgfds7iy370",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-08-30T09:50:48.760Z"
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
        "id" : 268,
        "username" : "User 377",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:48.719Z",
        "updatedAt" : "2016-08-30T09:50:48.719Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  ]
}
```
