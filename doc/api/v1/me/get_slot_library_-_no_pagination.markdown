# Me API

## Get slot library - no pagination

### GET /v1/me/library

Returns an array which includes all Slots the current user has created, was or is tagged to and all slots from calendars the current users has subscribed to.

Also slots which the current user had once in his schedule but removed them are included.

The slots are ordered by startdate, enddate, ID.

### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : creatorId
Description : ID of the User who created the slot

Name : alerts
Description : Alerts for the slot for the current user

Name : notes
Description : A list of all notes on the slot

Name : likes
Description : Number of likes for the slot

Name : commentsCounter
Description : Number of comments on the slot

Name : images
Description : Images for the slot

Name : audios
Description : Audio recordings for the slot

Name : videos
Description : Videos for the slot

Name : url
Description : direct url to fetch the slot

Name : visibility
Description : Visibility if it&#39;s a StandardSlot

Name : createdAt
Description : Creation datetime of the slot

Name : updatedAt
Description : Last update of the slot

Name : deletedAt
Description : Deletion datetime of the slot

### Request

#### Headers

<pre>Authorization: Token token=3CjJ4cqU2Of7GSzdpaKbRvVxflc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/library</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/library&quot; -X GET \
	-H &quot;Authorization: Token token=3CjJ4cqU2Of7GSzdpaKbRvVxflc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;95b43be81fb8f8e65cf55f556d6e1165&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5072c6d6-7dd3-44a8-aad2-7ac159a52099
X-Runtime: 0.040487
Content-Length: 1213</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 26,
    "title" : "Slot title 28",
    "description" : "",
    "startDate" : "2019-09-02T04:44:02.000Z",
    "rrule" : "",
    "createdAt" : "2016-12-11T19:48:27.515Z",
    "updatedAt" : "2016-12-11T19:48:27.515Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 56,
      "username" : "User 54",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-12-11T19:48:27.503Z",
      "updatedAt" : "2016-12-11T19:48:27.503Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  },
  {
    "id" : 27,
    "title" : "Slot title 29",
    "description" : "",
    "startDate" : "2019-09-03T05:44:02.000Z",
    "rrule" : "",
    "createdAt" : "2016-12-11T19:48:27.526Z",
    "updatedAt" : "2016-12-11T19:48:27.526Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 56,
      "username" : "User 54",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-12-11T19:48:27.503Z",
      "updatedAt" : "2016-12-11T19:48:27.503Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
