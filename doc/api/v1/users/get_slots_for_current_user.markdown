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
Authorization: Token token=8Jp5Uu9B83SaLNTjoH0mML8XNkw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/402/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/402/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=8Jp5Uu9B83SaLNTjoH0mML8XNkw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;640b83fa4e31c0ed4777280770c2a6c2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a04186da-b668-4654-8dd5-7b89c6f8b7ec
X-Runtime: 0.166639
Vary: Origin
Content-Length: 2351</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 111,
    "title" : "Slot title 98",
    "startDate" : "2019-09-18T02:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.478Z",
    "updatedAt" : "2015-09-14T10:33:05.478Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 403,
      "username" : "User 367",
      "createdAt" : "2015-09-14T10:33:05.473Z",
      "updatedAt" : "2015-09-14T10:33:05.473Z",
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
    "url" : "http://example.org/v1/slots/111"
  },
  {
    "id" : 112,
    "title" : "Slot title 99",
    "startDate" : "2019-09-19T03:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.487Z",
    "updatedAt" : "2015-09-14T10:33:05.487Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 404,
      "username" : "User 368",
      "createdAt" : "2015-09-14T10:33:05.482Z",
      "updatedAt" : "2015-09-14T10:33:05.482Z",
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
    "url" : "http://example.org/v1/slots/112"
  },
  {
    "id" : 114,
    "title" : "Slot title 101",
    "startDate" : "2019-09-21T05:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.500Z",
    "updatedAt" : "2015-09-14T10:33:05.527Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 402,
      "username" : "User 366",
      "createdAt" : "2015-09-14T10:33:05.467Z",
      "updatedAt" : "2015-09-14T10:33:05.467Z",
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
      "id" : 402
    },
    "parent" : {
      "id" : 115
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/114"
  },
  {
    "id" : 117,
    "title" : "Slot title 104",
    "startDate" : "2019-09-24T08:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.541Z",
    "updatedAt" : "2015-09-14T10:33:05.564Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 402,
      "username" : "User 366",
      "createdAt" : "2015-09-14T10:33:05.467Z",
      "updatedAt" : "2015-09-14T10:33:05.467Z",
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
      "id" : 402
    },
    "parent" : {
      "id" : 118
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/117"
  }
]
```
