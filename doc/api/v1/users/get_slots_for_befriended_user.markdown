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
Authorization: Token token=EBk6vVarH3EXXcC-pIFF1wIiGwc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/251/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/251/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=EBk6vVarH3EXXcC-pIFF1wIiGwc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;21ba7c6d1d2069dfb900c189b799e48e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 85c00d49-3d3b-4367-b1d0-89e96350aa89
X-Runtime: 0.135765
Content-Length: 2241</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 70,
    "title" : "Slot title 59",
    "startDate" : "2019-09-06T11:44:02.000Z",
    "createdAt" : "2015-06-15T08:50:45.334Z",
    "updatedAt" : "2015-06-15T08:50:45.334Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 253,
      "username" : "User 248",
      "createdAt" : "2015-06-15T08:50:45.329Z",
      "updatedAt" : "2015-06-15T08:50:45.329Z",
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
    "url" : "http://example.org/v1/slots/70"
  },
  {
    "id" : 71,
    "title" : "Slot title 60",
    "startDate" : "2019-09-07T12:44:02.000Z",
    "createdAt" : "2015-06-15T08:50:45.341Z",
    "updatedAt" : "2015-06-15T08:50:45.341Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 254,
      "username" : "User 249",
      "createdAt" : "2015-06-15T08:50:45.337Z",
      "updatedAt" : "2015-06-15T08:50:45.337Z",
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
    "url" : "http://example.org/v1/slots/71"
  },
  {
    "id" : 73,
    "title" : "Slot title 62",
    "startDate" : "2019-09-09T14:44:02.000Z",
    "createdAt" : "2015-06-15T08:50:45.353Z",
    "updatedAt" : "2015-06-15T08:50:45.371Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 257,
      "username" : "User 252",
      "createdAt" : "2015-06-15T08:50:45.356Z",
      "updatedAt" : "2015-06-15T08:50:45.356Z",
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
      "id" : 251
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/73"
  },
  {
    "id" : 75,
    "title" : "Slot title 64",
    "startDate" : "2019-09-11T16:44:02.000Z",
    "createdAt" : "2015-06-15T08:50:45.465Z",
    "updatedAt" : "2015-06-15T08:50:45.465Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 261,
      "username" : "User 256",
      "createdAt" : "2015-06-15T08:50:45.453Z",
      "updatedAt" : "2015-06-15T08:50:45.453Z",
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
    "url" : "http://example.org/v1/slots/75"
  }
]
```
