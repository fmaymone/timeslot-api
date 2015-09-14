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
Authorization: Token token=T8uR-IFE-9ADK6-YhQfRX1BbM8w
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/415/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/415/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=T8uR-IFE-9ADK6-YhQfRX1BbM8w&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1ff2c3623ee99fbc6a970a631da227eb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f0203fce-e0a2-4434-8ae0-c3fd09d9c03a
X-Runtime: 0.125525
Vary: Origin
Content-Length: 2302</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 120,
    "title" : "Slot title 107",
    "startDate" : "2019-09-27T11:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.764Z",
    "updatedAt" : "2015-09-14T10:33:05.764Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 417,
      "username" : "User 380",
      "createdAt" : "2015-09-14T10:33:05.759Z",
      "updatedAt" : "2015-09-14T10:33:05.759Z",
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
    "url" : "http://example.org/v1/slots/120"
  },
  {
    "id" : 121,
    "title" : "Slot title 108",
    "startDate" : "2019-09-01T12:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.772Z",
    "updatedAt" : "2015-09-14T10:33:05.772Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 418,
      "username" : "User 381",
      "createdAt" : "2015-09-14T10:33:05.767Z",
      "updatedAt" : "2015-09-14T10:33:05.767Z",
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
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/121"
  },
  {
    "id" : 123,
    "title" : "Slot title 110",
    "startDate" : "2019-09-03T14:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.789Z",
    "updatedAt" : "2015-09-14T10:33:05.807Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 415,
      "username" : "Joe",
      "createdAt" : "2015-09-14T10:33:05.747Z",
      "updatedAt" : "2015-09-14T10:33:05.747Z",
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
      "id" : 415
    },
    "parent" : {
      "id" : 124
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/123"
  },
  {
    "id" : 125,
    "title" : "Slot title 112",
    "startDate" : "2019-09-05T16:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:05.904Z",
    "updatedAt" : "2015-09-14T10:33:05.904Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 425,
      "username" : "User 388",
      "createdAt" : "2015-09-14T10:33:05.891Z",
      "updatedAt" : "2015-09-14T10:33:05.891Z",
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
    "group" : {
      "id" : 52
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/125"
  }
]
```
