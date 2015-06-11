# Users API

## Get slots for current user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots &amp; ReSlots

If a user is authenticated the slot settings (alerts) will be included.

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

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

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
Authorization: Token token=4l-t75y7462bjyAUdQPg_xnhfwk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/238/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/238/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=4l-t75y7462bjyAUdQPg_xnhfwk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2c6e2a15814ac8028955afcd62cf3da0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a7d9b4ba-1c35-41c8-8a59-70df344516fa
X-Runtime: 0.110461
Content-Length: 2345</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 61,
    "title" : "Slot title 50",
    "startDate" : "2019-09-24T02:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:00.792Z",
    "updatedAt" : "2015-06-11T16:21:00.792Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 239,
      "username" : "User 235",
      "createdAt" : "2015-06-11T16:21:00.786Z",
      "updatedAt" : "2015-06-11T16:21:00.786Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/61"
  },
  {
    "id" : 62,
    "title" : "Slot title 51",
    "startDate" : "2019-09-25T03:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:00.801Z",
    "updatedAt" : "2015-06-11T16:21:00.801Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 240,
      "username" : "User 236",
      "createdAt" : "2015-06-11T16:21:00.795Z",
      "updatedAt" : "2015-06-11T16:21:00.795Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/62"
  },
  {
    "id" : 64,
    "title" : "Slot title 53",
    "startDate" : "2019-09-27T05:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:00.815Z",
    "updatedAt" : "2015-06-11T16:21:00.833Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 243,
      "username" : "User 239",
      "createdAt" : "2015-06-11T16:21:00.818Z",
      "updatedAt" : "2015-06-11T16:21:00.818Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 238
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/64"
  },
  {
    "id" : 67,
    "title" : "Slot title 56",
    "startDate" : "2019-09-03T08:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:00.862Z",
    "updatedAt" : "2015-06-11T16:21:00.878Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 248,
      "username" : "User 244",
      "createdAt" : "2015-06-11T16:21:00.864Z",
      "updatedAt" : "2015-06-11T16:21:00.864Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 238
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/67"
  }
]
```
