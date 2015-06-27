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
Authorization: Token token=QLK2ntS7RPx1mtSKFG8kiEAisSs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/240/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/240/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=QLK2ntS7RPx1mtSKFG8kiEAisSs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dc3a0fa6e4669499210a342ce9a92a39&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0b310aa2-4d45-471b-9958-11fb16e90a68
X-Runtime: 0.112621
Content-Length: 2321</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 62,
    "title" : "Slot title 51",
    "startDate" : "2019-09-25T03:44:02.000Z",
    "endDate" : "2019-10-25T03:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.433Z",
    "updatedAt" : "2015-06-27T07:27:24.433Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 241,
      "username" : "User 237",
      "createdAt" : "2015-06-27T07:27:24.428Z",
      "updatedAt" : "2015-06-27T07:27:24.428Z",
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
    "url" : "http://example.org/v1/slots/62"
  },
  {
    "id" : 63,
    "title" : "Slot title 52",
    "startDate" : "2019-09-26T04:44:02.000Z",
    "endDate" : "2019-10-26T04:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.440Z",
    "updatedAt" : "2015-06-27T07:27:24.440Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 242,
      "username" : "User 238",
      "createdAt" : "2015-06-27T07:27:24.435Z",
      "updatedAt" : "2015-06-27T07:27:24.435Z",
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
    "url" : "http://example.org/v1/slots/63"
  },
  {
    "id" : 65,
    "title" : "Slot title 54",
    "startDate" : "2019-09-01T06:44:02.000Z",
    "endDate" : "2019-10-01T06:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.452Z",
    "updatedAt" : "2015-06-27T07:27:24.474Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 245,
      "username" : "User 241",
      "createdAt" : "2015-06-27T07:27:24.454Z",
      "updatedAt" : "2015-06-27T07:27:24.454Z",
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
    "endDate" : "2019-10-04T09:44:02.000Z",
    "createdAt" : "2015-06-27T07:27:24.486Z",
    "updatedAt" : "2015-06-27T07:27:24.502Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 250,
      "username" : "User 246",
      "createdAt" : "2015-06-27T07:27:24.488Z",
      "updatedAt" : "2015-06-27T07:27:24.488Z",
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
      "id" : 240
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/68"
  }
]
```
