# Me API

## Get slots from friends

### GET /v1/me/friendslots

Returns an array which includes the public and friend-visible StandardSlots &amp; ReSlots of all friends from the current user

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
Authorization: Token token=4DCd5QRMzCy9q5cdAuQTl2ZaTYs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=4DCd5QRMzCy9q5cdAuQTl2ZaTYs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1ec2f6ff3a8e2168996e2bf5cf621a3c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 87ab8c98-4f10-49b2-857b-34b81ec126b9
X-Runtime: 0.049493
Vary: Origin
Content-Length: 1575</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 23,
    "title" : "Slot title 39",
    "startDate" : "2019-09-16T18:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:48.991Z",
    "updatedAt" : "2015-12-04T16:56:48.991Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 122,
      "username" : "User 173",
      "createdAt" : "2015-12-04T16:56:48.974Z",
      "updatedAt" : "2015-12-04T16:56:48.974Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 120
    },
    "parent" : {
      "id" : 22
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 24,
    "title" : "Slot title 41",
    "startDate" : "2019-09-18T20:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:49.037Z",
    "updatedAt" : "2015-12-04T16:56:49.037Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 126,
      "username" : "User 177",
      "createdAt" : "2015-12-04T16:56:49.032Z",
      "updatedAt" : "2015-12-04T16:56:49.032Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 25,
    "title" : "Slot title 42",
    "startDate" : "2019-09-19T21:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:49.062Z",
    "updatedAt" : "2015-12-04T16:56:49.062Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 129,
      "username" : "User 180",
      "createdAt" : "2015-12-04T16:56:49.058Z",
      "updatedAt" : "2015-12-04T16:56:49.058Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
