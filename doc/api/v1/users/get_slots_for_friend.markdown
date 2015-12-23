# Users API

## Get slots for Friend

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39;, &#39;foaf&#39; (friend-of-friend) or &#39;public&#39;, ReSlots &amp; shared GroupSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : id
Description : ID of the user to get the slots for.


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

<pre>Authorization: Token token=wMmhicSMFtNol8c9X0hFHEZIrh0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/161/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/161/slots&quot; -X GET \
	-H &quot;Authorization: Token token=wMmhicSMFtNol8c9X0hFHEZIrh0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;00691717f6745dee463a4d2f3595d660&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1f7262f9-bf6d-4c94-98ec-1d5176bc250a
X-Runtime: 0.042688
Vary: Origin
Content-Length: 2577</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 70,
    "title" : "Slot title 133",
    "startDate" : "2019-09-03T17:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:37.670Z",
    "updatedAt" : "2015-12-23T11:18:37.670Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 163,
      "username" : "User 455",
      "createdAt" : "2015-12-23T11:18:37.666Z",
      "updatedAt" : "2015-12-23T11:18:37.666Z",
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
    "id" : 71,
    "title" : "Slot title 134",
    "startDate" : "2019-09-04T18:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:37.677Z",
    "updatedAt" : "2015-12-23T11:18:37.677Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 164,
      "username" : "User 456",
      "createdAt" : "2015-12-23T11:18:37.673Z",
      "updatedAt" : "2015-12-23T11:18:37.673Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "foaf",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 72,
    "title" : "Slot title 135",
    "startDate" : "2019-09-05T19:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:37.683Z",
    "updatedAt" : "2015-12-23T11:18:37.683Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 165,
      "username" : "User 457",
      "createdAt" : "2015-12-23T11:18:37.679Z",
      "updatedAt" : "2015-12-23T11:18:37.679Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 74,
    "title" : "Slot title 136",
    "startDate" : "2019-09-06T20:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:37.701Z",
    "updatedAt" : "2015-12-23T11:18:37.701Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 166,
      "username" : "User 458",
      "createdAt" : "2015-12-23T11:18:37.686Z",
      "updatedAt" : "2015-12-23T11:18:37.686Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 161
    },
    "parent" : {
      "id" : 73
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 75,
    "title" : "Slot title 138",
    "startDate" : "2019-09-08T22:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:37.758Z",
    "updatedAt" : "2015-12-23T11:18:37.758Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 170,
      "username" : "User 462",
      "createdAt" : "2015-12-23T11:18:37.748Z",
      "updatedAt" : "2015-12-23T11:18:37.748Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "group" : {
      "id" : 14
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
