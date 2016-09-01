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
Authorization: Token token=d_lSIq6R1XvgQfMphELuc0jGXro
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/feed/user</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/feed/user&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=d_lSIq6R1XvgQfMphELuc0jGXro&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1f3dd88c563fba4ebd117344bb7a4da3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2203232b-806b-476d-8d36-b4c86385867c
X-Runtime: 0.014498
Content-Length: 2524</pre>

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
      "time" : "2016-08-30T09:50:48.565Z",
      "id" : "8A15165CC2C84E0926C825474FE486BBD809621A",
      "message" : "You commented on the Slot: {slot}",
      "actors" : [
        {
          "id" : 266,
          "username" : "User 375",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.561Z",
          "updatedAt" : "2016-08-30T09:50:48.561Z",
          "deletedAt" : null,
          "image" : ""
        }
      ],
      "group" : null,
      "slot" : {
        "id" : 106,
        "title" : "Slot title 21",
        "description" : "",
        "startDate" : "2019-09-26T07:44:02.000Z",
        "createdAt" : "2016-08-30T09:50:48.529Z",
        "updatedAt" : "2016-08-30T09:50:48.573Z",
        "deletedAt" : null,
        "endDate" : "2019-10-26T07:44:02.000Z",
        "location" : {
          "id" : "3cb2dbde-0948-4794-88fc-af04494e2efe",
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
          "id" : 263,
          "username" : "User 371",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-08-30T09:50:48.495Z",
          "updatedAt" : "2016-08-30T09:50:48.495Z",
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
            "createdAt" : "2016-08-30T09:50:48.559Z",
            "duration" : null,
            "title" : "Title 369"
          },
          {
            "mediaId" : 455,
            "publicId" : "dfhjghjkdisudgfds7iy368",
            "position" : 4,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-08-30T09:50:48.553Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 454,
            "publicId" : "dfhjghjkdisudgfds7iy367",
            "position" : 3,
            "localId" : null,
            "mediaType" : "video",
            "createdAt" : "2016-08-30T09:50:48.547Z",
            "duration" : null,
            "thumbnail" : null
          },
          {
            "mediaId" : 453,
            "publicId" : "dfhjghjkdisudgfds7iy366",
            "position" : 2,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-08-30T09:50:48.544Z"
          },
          {
            "mediaId" : 452,
            "publicId" : "dfhjghjkdisudgfds7iy365",
            "position" : 1,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-08-30T09:50:48.540Z"
          },
          {
            "mediaId" : 451,
            "publicId" : "dfhjghjkdisudgfds7iy364",
            "position" : 0,
            "localId" : null,
            "mediaType" : "image",
            "createdAt" : "2016-08-30T09:50:48.537Z"
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
        "id" : 263,
        "username" : "User 371",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:48.495Z",
        "updatedAt" : "2016-08-30T09:50:48.495Z",
        "deletedAt" : null,
        "image" : ""
      }
    }
  ]
}
```
