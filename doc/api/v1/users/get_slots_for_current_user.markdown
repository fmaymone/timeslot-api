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

Name : openEnd
Description : OpenEnd Boolean Flag of the slot

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
Authorization: Token token=QMs-nbUzjQoH6YA3BQAnCg5lUaU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/259/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/259/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=QMs-nbUzjQoH6YA3BQAnCg5lUaU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b51ac9f3afbacfcb9742cf38c97fb8d8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9508467a-34c3-4fda-bed6-d05ec2f8123a
X-Runtime: 0.102473
Content-Length: 2321</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 63,
    "title" : "Slot title 52",
    "startDate" : "2019-09-26T04:44:02.000Z",
    "endDate" : "2019-10-26T04:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:25.953Z",
    "updatedAt" : "2015-07-02T12:34:25.953Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 260,
      "username" : "User 244",
      "createdAt" : "2015-07-02T12:34:25.947Z",
      "updatedAt" : "2015-07-02T12:34:25.947Z",
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
    "url" : "http://example.org/v1/slots/63"
  },
  {
    "id" : 64,
    "title" : "Slot title 53",
    "startDate" : "2019-09-27T05:44:02.000Z",
    "endDate" : "2019-10-27T05:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:25.963Z",
    "updatedAt" : "2015-07-02T12:34:25.963Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 261,
      "username" : "User 245",
      "createdAt" : "2015-07-02T12:34:25.957Z",
      "updatedAt" : "2015-07-02T12:34:25.957Z",
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
    "url" : "http://example.org/v1/slots/64"
  },
  {
    "id" : 66,
    "title" : "Slot title 55",
    "startDate" : "2019-09-02T07:44:02.000Z",
    "endDate" : "2019-10-02T07:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:25.978Z",
    "updatedAt" : "2015-07-02T12:34:25.998Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 264,
      "username" : "User 248",
      "createdAt" : "2015-07-02T12:34:25.981Z",
      "updatedAt" : "2015-07-02T12:34:25.981Z",
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
      "id" : 259
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/66"
  },
  {
    "id" : 69,
    "title" : "Slot title 58",
    "startDate" : "2019-09-05T10:44:02.000Z",
    "endDate" : "2019-10-05T10:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.013Z",
    "updatedAt" : "2015-07-02T12:34:26.038Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 269,
      "username" : "User 253",
      "createdAt" : "2015-07-02T12:34:26.017Z",
      "updatedAt" : "2015-07-02T12:34:26.017Z",
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
      "id" : 259
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/69"
  }
]
```
