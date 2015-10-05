# Users API

## Get slots for current user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots &amp; ReSlots

If a user is authenticated the slot settings (alerts) will be included.

The returned slots are ordered by startdate, enddate, id.

### Parameters

Name : id
Description : ID of the user to get the slots for.


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

<pre>Authorization: Token token=Ob5nRYMcnXNQX8gHn63985RR_as
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/430/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/430/slots&quot; -X GET \
	-H &quot;Authorization: Token token=Ob5nRYMcnXNQX8gHn63985RR_as&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;635c01bf46aa38e0a7b77bd957eb7af3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8d0db7db-050b-478f-b3d8-d84618ef847b
X-Runtime: 0.090383
Vary: Origin
Content-Length: 2353</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 127,
    "title" : "Slot title 112",
    "startDate" : "2019-09-05T16:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.560Z",
    "updatedAt" : "2015-10-04T20:11:46.560Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 431,
      "username" : "User 393",
      "createdAt" : "2015-10-04T20:11:46.555Z",
      "updatedAt" : "2015-10-04T20:11:46.555Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/127"
  },
  {
    "id" : 128,
    "title" : "Slot title 113",
    "startDate" : "2019-09-06T17:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.567Z",
    "updatedAt" : "2015-10-04T20:11:46.567Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 432,
      "username" : "User 394",
      "createdAt" : "2015-10-04T20:11:46.563Z",
      "updatedAt" : "2015-10-04T20:11:46.563Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/128"
  },
  {
    "id" : 130,
    "title" : "Slot title 115",
    "startDate" : "2019-09-08T19:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.580Z",
    "updatedAt" : "2015-10-04T20:11:46.602Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 435,
      "username" : "User 397",
      "createdAt" : "2015-10-04T20:11:46.583Z",
      "updatedAt" : "2015-10-04T20:11:46.583Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 430
    },
    "parent" : {
      "id" : 131
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/130"
  },
  {
    "id" : 133,
    "title" : "Slot title 118",
    "startDate" : "2019-09-11T22:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.618Z",
    "updatedAt" : "2015-10-04T20:11:46.634Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 440,
      "username" : "User 402",
      "createdAt" : "2015-10-04T20:11:46.621Z",
      "updatedAt" : "2015-10-04T20:11:46.621Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 430
    },
    "parent" : {
      "id" : 134
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/133"
  }
]
```
