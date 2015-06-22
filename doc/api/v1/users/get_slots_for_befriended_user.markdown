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
Authorization: Token token=CR3LGRrhFHVH5XF7mqRrqG-IweU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/253/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/253/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CR3LGRrhFHVH5XF7mqRrqG-IweU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;90c70e2053756eaea12a9c741b52f7fb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4b5016cc-7db6-4825-b663-7c4b0997d2ba
X-Runtime: 0.113864
Content-Length: 2253</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 71,
    "title" : "Slot title 60",
    "startDate" : "2019-09-07T12:44:02.000Z",
    "createdAt" : "2015-06-22T08:44:28.961Z",
    "updatedAt" : "2015-06-22T08:44:28.961Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 255,
      "username" : "User 250",
      "createdAt" : "2015-06-22T08:44:28.955Z",
      "updatedAt" : "2015-06-22T08:44:28.955Z",
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
    "url" : "http://example.org/v1/slots/71"
  },
  {
    "id" : 72,
    "title" : "Slot title 61",
    "startDate" : "2019-09-08T13:44:02.000Z",
    "createdAt" : "2015-06-22T08:44:28.969Z",
    "updatedAt" : "2015-06-22T08:44:28.969Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 256,
      "username" : "User 251",
      "createdAt" : "2015-06-22T08:44:28.964Z",
      "updatedAt" : "2015-06-22T08:44:28.964Z",
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
    "url" : "http://example.org/v1/slots/72"
  },
  {
    "id" : 74,
    "title" : "Slot title 63",
    "startDate" : "2019-09-10T15:44:02.000Z",
    "createdAt" : "2015-06-22T08:44:28.982Z",
    "updatedAt" : "2015-06-22T08:44:29.001Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 259,
      "username" : "User 254",
      "createdAt" : "2015-06-22T08:44:28.988Z",
      "updatedAt" : "2015-06-22T08:44:28.988Z",
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
    "createdAt" : "2015-06-22T08:44:29.095Z",
    "updatedAt" : "2015-06-22T08:44:29.095Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 263,
      "username" : "User 258",
      "createdAt" : "2015-06-22T08:44:29.083Z",
      "updatedAt" : "2015-06-22T08:44:29.083Z",
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
      "id" : 46
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/76"
  }
]
```
