# Users API

## Get slots for befriended user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39; or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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
Authorization: Token token=_O1ukwGJi3OrvvuTxCqCoLWIqdE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/253/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/253/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_O1ukwGJi3OrvvuTxCqCoLWIqdE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;95273f50e8917cd2265d5698ed4d3730&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a8ac36be-3ef3-4cb3-9c09-96a9a630d3ed
X-Runtime: 0.128100
Content-Length: 2241</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 71,
    "title" : "Slot title 60",
    "startDate" : "2019-09-07T12:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.763Z",
    "updatedAt" : "2015-06-16T15:50:03.763Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 255,
      "username" : "User 250",
      "createdAt" : "2015-06-16T15:50:03.759Z",
      "updatedAt" : "2015-06-16T15:50:03.759Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
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
    "url" : "http://example.org/v1/slots/71"
  },
  {
    "id" : 72,
    "title" : "Slot title 61",
    "startDate" : "2019-09-08T13:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.771Z",
    "updatedAt" : "2015-06-16T15:50:03.771Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 256,
      "username" : "User 251",
      "createdAt" : "2015-06-16T15:50:03.766Z",
      "updatedAt" : "2015-06-16T15:50:03.766Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/72"
  },
  {
    "id" : 74,
    "title" : "Slot title 63",
    "startDate" : "2019-09-10T15:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.782Z",
    "updatedAt" : "2015-06-16T15:50:03.798Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 259,
      "username" : "User 254",
      "createdAt" : "2015-06-16T15:50:03.785Z",
      "updatedAt" : "2015-06-16T15:50:03.785Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 253
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/74"
  },
  {
    "id" : 76,
    "title" : "Slot title 65",
    "startDate" : "2019-09-12T17:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.890Z",
    "updatedAt" : "2015-06-16T15:50:03.890Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 263,
      "username" : "User 258",
      "createdAt" : "2015-06-16T15:50:03.878Z",
      "updatedAt" : "2015-06-16T15:50:03.878Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "group" : {
      "id" : 46
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/76"
  }
]
```
