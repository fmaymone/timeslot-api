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
Authorization: Token token=JKJg8-SASTllz5MR9rNGJXezVOs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/253/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/253/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=JKJg8-SASTllz5MR9rNGJXezVOs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4438cb02c1646bc6861e3f847f783522&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2e2f5bb0-f6b6-48b9-95fe-5170e26ff8bd
X-Runtime: 0.122378
Content-Length: 2317</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 71,
    "title" : "Slot title 60",
    "startDate" : "2019-09-07T12:44:02.000Z",
    "endDate" : "2019-10-07T12:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.660Z",
    "updatedAt" : "2015-06-27T07:27:24.660Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 255,
      "username" : "User 250",
      "createdAt" : "2015-06-27T07:27:24.653Z",
      "updatedAt" : "2015-06-27T07:27:24.653Z",
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
    "endDate" : "2019-10-08T13:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.668Z",
    "updatedAt" : "2015-06-27T07:27:24.668Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 256,
      "username" : "User 251",
      "createdAt" : "2015-06-27T07:27:24.663Z",
      "updatedAt" : "2015-06-27T07:27:24.663Z",
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
    "endDate" : "2019-10-10T15:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.680Z",
    "updatedAt" : "2015-06-27T07:27:24.704Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 259,
      "username" : "User 254",
      "createdAt" : "2015-06-27T07:27:24.683Z",
      "updatedAt" : "2015-06-27T07:27:24.683Z",
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
    "endDate" : "2019-10-12T17:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.796Z",
    "updatedAt" : "2015-06-27T07:27:24.796Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 263,
      "username" : "User 258",
      "createdAt" : "2015-06-27T07:27:24.784Z",
      "updatedAt" : "2015-06-27T07:27:24.784Z",
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
