# Me API

## Get slots from friends

### GET /v1/me/friendslots

Returns an array which includes all non-private StandardSlots &amp; ReSlots from all friends of the current user.

This endpoint supports pagination in the same style as the &#39;/me/slots&#39; route.

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

<pre>Accept: application/json
Authorization: Token token=dIk2EMe5bSPe4fgi16-x9Ro8Ktk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dIk2EMe5bSPe4fgi16-x9Ro8Ktk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;97cccefa25e48035b8ffe2fadc50c2d7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 58e53d34-593d-416d-a1c5-83ea84930cd9
X-Runtime: 0.019248
Vary: Origin
Content-Length: 1903</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 10,
    "title" : "Slot title 38",
    "startDate" : "2019-09-15T17:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:23.993Z",
    "updatedAt" : "2016-04-04T20:50:23.993Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 24,
      "username" : "User 186",
      "createdAt" : "2016-04-04T20:50:23.986Z",
      "updatedAt" : "2016-04-04T20:50:23.986Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 11,
    "title" : "Slot title 39",
    "startDate" : "2019-09-16T18:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:24.015Z",
    "updatedAt" : "2016-04-04T20:50:24.015Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 27,
      "username" : "User 189",
      "createdAt" : "2016-04-04T20:50:24.010Z",
      "updatedAt" : "2016-04-04T20:50:24.010Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 13,
    "title" : "Slot title 41",
    "startDate" : "2019-09-18T20:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:24.043Z",
    "updatedAt" : "2016-04-04T20:50:24.043Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 30,
      "username" : "User 192",
      "createdAt" : "2016-04-04T20:50:24.034Z",
      "updatedAt" : "2016-04-04T20:50:24.034Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 14,
    "title" : "Slot title 42",
    "startDate" : "2019-09-19T21:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:24.050Z",
    "updatedAt" : "2016-04-04T20:50:24.050Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 31,
      "username" : "User 193",
      "createdAt" : "2016-04-04T20:50:24.045Z",
      "updatedAt" : "2016-04-04T20:50:24.045Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
