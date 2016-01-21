# Me API

## Get slots - no pagination

### GET /v1/me/slots

Returns an array which includes all StandardSlots &amp; ReSlots the current_user has created including the slot settings (alerts).

The slots are ordered by startdate, enddate, ID.

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

<pre>Authorization: Token token=nEQuNByKlphOd9r72onr7sUwfuQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=nEQuNByKlphOd9r72onr7sUwfuQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;619ff7b4626fca37d2a98e26300333fb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6688cef2-8f29-431e-a4e3-e8772fea25f5
X-Runtime: 0.030315
Vary: Origin
Content-Length: 2120</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 8,
    "title" : "Slot title 35",
    "startDate" : "2019-09-12T14:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.779Z",
    "updatedAt" : "2016-01-21T23:11:37.779Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 96,
      "username" : "User 174",
      "createdAt" : "2016-01-21T23:11:37.776Z",
      "updatedAt" : "2016-01-21T23:11:37.776Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 9,
    "title" : "Slot title 36",
    "startDate" : "2019-09-13T15:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.785Z",
    "updatedAt" : "2016-01-21T23:11:37.785Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 97,
      "username" : "User 175",
      "createdAt" : "2016-01-21T23:11:37.782Z",
      "updatedAt" : "2016-01-21T23:11:37.782Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 11,
    "title" : "Slot title 37",
    "startDate" : "2019-09-14T16:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.800Z",
    "updatedAt" : "2016-01-21T23:11:37.800Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 98,
      "username" : "User 176",
      "createdAt" : "2016-01-21T23:11:37.788Z",
      "updatedAt" : "2016-01-21T23:11:37.788Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 95
    },
    "parent" : {
      "id" : 10
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 13,
    "title" : "Slot title 39",
    "startDate" : "2019-09-16T18:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.855Z",
    "updatedAt" : "2016-01-21T23:11:37.855Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 101,
      "username" : "User 179",
      "createdAt" : "2016-01-21T23:11:37.842Z",
      "updatedAt" : "2016-01-21T23:11:37.842Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 95
    },
    "parent" : {
      "id" : 12
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
