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
Authorization: Token token=PETdJnhx7o2Rd0VyBtZFTcfOmEY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=PETdJnhx7o2Rd0VyBtZFTcfOmEY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;317572f7b2eb2392d333faa26d6c93d9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1f53201e-60d2-456d-b3ec-637ac97bb9c4
X-Runtime: 0.034495
Vary: Origin
Content-Length: 2598</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 19,
    "title" : "Slot title 40",
    "startDate" : "2019-09-17T19:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:31.946Z",
    "updatedAt" : "2015-12-23T11:18:31.946Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 112,
      "username" : "User 178",
      "createdAt" : "2015-12-23T11:18:31.942Z",
      "updatedAt" : "2015-12-23T11:18:31.942Z",
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
    "id" : 20,
    "title" : "Slot title 41",
    "startDate" : "2019-09-18T20:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:31.953Z",
    "updatedAt" : "2015-12-23T11:18:31.953Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 113,
      "username" : "User 179",
      "createdAt" : "2015-12-23T11:18:31.949Z",
      "updatedAt" : "2015-12-23T11:18:31.949Z",
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
  },
  {
    "id" : 22,
    "title" : "Slot title 42",
    "startDate" : "2019-09-19T21:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:31.971Z",
    "updatedAt" : "2015-12-23T11:18:31.971Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 114,
      "username" : "User 180",
      "createdAt" : "2015-12-23T11:18:31.956Z",
      "updatedAt" : "2015-12-23T11:18:31.956Z",
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
      "id" : 110
    },
    "parent" : {
      "id" : 21
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 23,
    "title" : "Slot title 44",
    "startDate" : "2019-09-21T23:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:32.009Z",
    "updatedAt" : "2015-12-23T11:18:32.009Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 118,
      "username" : "User 184",
      "createdAt" : "2015-12-23T11:18:32.005Z",
      "updatedAt" : "2015-12-23T11:18:32.005Z",
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
    "id" : 24,
    "title" : "Slot title 45",
    "startDate" : "2019-09-22T00:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:32.041Z",
    "updatedAt" : "2015-12-23T11:18:32.041Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 121,
      "username" : "User 187",
      "createdAt" : "2015-12-23T11:18:32.037Z",
      "updatedAt" : "2015-12-23T11:18:32.037Z",
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
