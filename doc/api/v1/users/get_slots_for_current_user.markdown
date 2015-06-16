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
Authorization: Token token=53d6WPpq0ovIQPyVGvpySlLm45w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/240/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/240/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=53d6WPpq0ovIQPyVGvpySlLm45w&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ed7c2cf88854c8f3922bad30f949adf2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3c60fc67-9387-4cd6-a69b-c8439dc9838b
X-Runtime: 0.095710
Content-Length: 2245</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 62,
    "title" : "Slot title 51",
    "startDate" : "2019-09-25T03:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.562Z",
    "updatedAt" : "2015-06-16T15:50:03.562Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 241,
      "username" : "User 237",
      "createdAt" : "2015-06-16T15:50:03.557Z",
      "updatedAt" : "2015-06-16T15:50:03.557Z",
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
    "url" : "http://example.org/v1/slots/62"
  },
  {
    "id" : 63,
    "title" : "Slot title 52",
    "startDate" : "2019-09-26T04:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.569Z",
    "updatedAt" : "2015-06-16T15:50:03.569Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 242,
      "username" : "User 238",
      "createdAt" : "2015-06-16T15:50:03.565Z",
      "updatedAt" : "2015-06-16T15:50:03.565Z",
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
    "url" : "http://example.org/v1/slots/63"
  },
  {
    "id" : 65,
    "title" : "Slot title 54",
    "startDate" : "2019-09-01T06:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.580Z",
    "updatedAt" : "2015-06-16T15:50:03.597Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 245,
      "username" : "User 241",
      "createdAt" : "2015-06-16T15:50:03.583Z",
      "updatedAt" : "2015-06-16T15:50:03.583Z",
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
      "id" : 240
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/65"
  },
  {
    "id" : 68,
    "title" : "Slot title 57",
    "startDate" : "2019-09-04T09:44:02.000Z",
    "createdAt" : "2015-06-16T15:50:03.610Z",
    "updatedAt" : "2015-06-16T15:50:03.627Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 250,
      "username" : "User 246",
      "createdAt" : "2015-06-16T15:50:03.613Z",
      "updatedAt" : "2015-06-16T15:50:03.613Z",
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
      "id" : 240
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/68"
  }
]
```
