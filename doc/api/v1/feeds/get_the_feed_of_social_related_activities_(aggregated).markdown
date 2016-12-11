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
Authorization: Token token=AveWdx5IrpS9auyHlwG1T_iTtbU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/news</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/news&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=AveWdx5IrpS9auyHlwG1T_iTtbU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4f53ea610efa4fdf7c4ac597323df00c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2c439cc5-8f30-43e1-91f4-46796fe5380e
X-Runtime: 0.005806
Content-Length: 2547</pre>

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
      "time" : "2016-12-11T19:54:17.730Z",
      "id" : "433C2ECB652D527A0CB6626ED43D67AFFD65A32A",
      "message" : "{actor} commented on this Slot.",
      "cursor" : "1",
      "actors" : [
        {
          "id" : 271,
          "username" : "User 381",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:54:17.726Z",
          "updatedAt" : "2016-12-11T19:54:17.726Z",
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
        "rrule" : "",
        "createdAt" : "2016-12-11T19:54:17.702Z",
        "updatedAt" : "2016-12-11T19:54:17.737Z",
        "deletedAt" : null,
        "endDate" : "2019-10-27T08:44:02.000Z",
        "location" : {
          "id" : "1034fa79-62af-4aa7-ad98-5b72867d2d4f",
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
          "createdAt" : "2016-12-11T19:54:17.686Z",
          "updatedAt" : "2016-12-11T19:54:17.686Z",
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
            "createdAt" : "2016-12-11T19:54:17.722Z",
            "duration" : null,
            "title" : "Title 375"
          },
          {
            "mediaId" : 461,
            "publicId" : "dfhjghjkdisudgfds7iy374",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-12-11T19:54:17.720Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 460,
            "publicId" : "dfhjghjkdisudgfds7iy373",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-12-11T19:54:17.717Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 459,
            "publicId" : "dfhjghjkdisudgfds7iy372",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-12-11T19:54:17.714Z"
          },
          {
            "mediaId" : 458,
            "publicId" : "dfhjghjkdisudgfds7iy371",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-12-11T19:54:17.712Z"
          },
          {
            "mediaId" : 457,
            "publicId" : "dfhjghjkdisudgfds7iy370",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-12-11T19:54:17.709Z"
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
        "createdAt" : "2016-12-11T19:54:17.686Z",
        "updatedAt" : "2016-12-11T19:54:17.686Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  ]
}
```
