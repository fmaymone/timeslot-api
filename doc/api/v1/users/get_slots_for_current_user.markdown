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
Authorization: Token token=S8odMAEACErVkKC0R9kQREl1nhU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/416/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/416/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=S8odMAEACErVkKC0R9kQREl1nhU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0ac5c314ea54c4315fec1349cf4f351c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d59e097b-fc92-4203-aa8c-6d88755e2ee4
X-Runtime: 0.114871
Vary: Origin
Content-Length: 2353</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 118,
    "title" : "Slot title 103",
    "startDate" : "2019-09-23T07:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:05.815Z",
    "updatedAt" : "2015-09-28T10:16:05.815Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T07:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 417,
      "username" : "User 379",
      "createdAt" : "2015-09-28T10:16:05.810Z",
      "updatedAt" : "2015-09-28T10:16:05.810Z",
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
    "url" : "http://example.org/v1/slots/118"
  },
  {
    "id" : 119,
    "title" : "Slot title 104",
    "startDate" : "2019-09-24T08:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:05.822Z",
    "updatedAt" : "2015-09-28T10:16:05.822Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 418,
      "username" : "User 380",
      "createdAt" : "2015-09-28T10:16:05.818Z",
      "updatedAt" : "2015-09-28T10:16:05.818Z",
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
    "url" : "http://example.org/v1/slots/119"
  },
  {
    "id" : 121,
    "title" : "Slot title 106",
    "startDate" : "2019-09-26T10:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:05.835Z",
    "updatedAt" : "2015-09-28T10:16:05.858Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 421,
      "username" : "User 383",
      "createdAt" : "2015-09-28T10:16:05.838Z",
      "updatedAt" : "2015-09-28T10:16:05.838Z",
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
      "id" : 416
    },
    "parent" : {
      "id" : 122
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/121"
  },
  {
    "id" : 124,
    "title" : "Slot title 109",
    "startDate" : "2019-09-02T13:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:05.876Z",
    "updatedAt" : "2015-09-28T10:16:05.901Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 426,
      "username" : "User 388",
      "createdAt" : "2015-09-28T10:16:05.878Z",
      "updatedAt" : "2015-09-28T10:16:05.878Z",
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
      "id" : 416
    },
    "parent" : {
      "id" : 125
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/124"
  }
]
```
