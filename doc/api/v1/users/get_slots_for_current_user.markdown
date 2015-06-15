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
Authorization: Token token=JDiiorYMjrbiEge5DYJIcyhcmI4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/238/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/238/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=JDiiorYMjrbiEge5DYJIcyhcmI4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7b2877a439b76aa62b38cb9bb55fc11e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ae935a6f-2bbe-4053-93be-bb72434dba88
X-Runtime: 0.104745
Content-Length: 2245</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 61,
    "title" : "Slot title 50",
    "startDate" : "2019-09-24T02:44:02.000Z",
    "createdAt" : "2015-06-15T08:50:45.112Z",
    "updatedAt" : "2015-06-15T08:50:45.112Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 239,
      "username" : "User 235",
      "createdAt" : "2015-06-15T08:50:45.107Z",
      "updatedAt" : "2015-06-15T08:50:45.107Z",
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
    "createdAt" : "2015-06-15T08:50:45.119Z",
    "updatedAt" : "2015-06-15T08:50:45.119Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 240,
      "username" : "User 236",
      "createdAt" : "2015-06-15T08:50:45.115Z",
      "updatedAt" : "2015-06-15T08:50:45.115Z",
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
    "url" : "http://example.org/v1/slots/62"
  },
  {
    "id" : 64,
    "title" : "Slot title 53",
    "startDate" : "2019-09-27T05:44:02.000Z",
    "createdAt" : "2015-06-15T08:50:45.130Z",
    "updatedAt" : "2015-06-15T08:50:45.150Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 243,
      "username" : "User 239",
      "createdAt" : "2015-06-15T08:50:45.133Z",
      "updatedAt" : "2015-06-15T08:50:45.133Z",
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
    "createdAt" : "2015-06-15T08:50:45.165Z",
    "updatedAt" : "2015-06-15T08:50:45.182Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 248,
      "username" : "User 244",
      "createdAt" : "2015-06-15T08:50:45.168Z",
      "updatedAt" : "2015-06-15T08:50:45.168Z",
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
      "id" : 238
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/67"
  }
]
```
