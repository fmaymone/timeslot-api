# Me API

## Get slots from friends

### GET /v1/me/friendslots

Returns an array which includes all non-private StandardSlots &amp; ReSlots from all friends of the current user.

This endpoint supports pagination in the same style as the &#39;/me/slots&#39; route.

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
Authorization: Token token=zB0FSa_zJaZz_vhBFrYvX7x1x24
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=zB0FSa_zJaZz_vhBFrYvX7x1x24&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;316f3b309324ec13451688122a995c98&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a7027b23-9095-4e12-94c1-3bb4d8d66d9d
X-Runtime: 0.040531
Vary: Origin
Content-Length: 2598</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 22,
    "title" : "Slot title 39",
    "startDate" : "2019-09-16T18:44:02.000Z",
    "createdAt" : "2015-12-07T23:17:56.632Z",
    "updatedAt" : "2015-12-07T23:17:56.632Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 122,
      "username" : "User 173",
      "createdAt" : "2015-12-07T23:17:56.628Z",
      "updatedAt" : "2015-12-07T23:17:56.628Z",
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
    "id" : 23,
    "title" : "Slot title 40",
    "startDate" : "2019-09-17T19:44:02.000Z",
    "createdAt" : "2015-12-07T23:17:56.641Z",
    "updatedAt" : "2015-12-07T23:17:56.641Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 123,
      "username" : "User 174",
      "createdAt" : "2015-12-07T23:17:56.635Z",
      "updatedAt" : "2015-12-07T23:17:56.635Z",
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
    "id" : 25,
    "title" : "Slot title 41",
    "startDate" : "2019-09-18T20:44:02.000Z",
    "createdAt" : "2015-12-07T23:17:56.665Z",
    "updatedAt" : "2015-12-07T23:17:56.665Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 124,
      "username" : "User 175",
      "createdAt" : "2015-12-07T23:17:56.644Z",
      "updatedAt" : "2015-12-07T23:17:56.644Z",
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
      "id" : 120
    },
    "parent" : {
      "id" : 24
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 26,
    "title" : "Slot title 43",
    "startDate" : "2019-09-20T22:44:02.000Z",
    "createdAt" : "2015-12-07T23:17:56.710Z",
    "updatedAt" : "2015-12-07T23:17:56.710Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 128,
      "username" : "User 179",
      "createdAt" : "2015-12-07T23:17:56.705Z",
      "updatedAt" : "2015-12-07T23:17:56.705Z",
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
    "id" : 27,
    "title" : "Slot title 44",
    "startDate" : "2019-09-21T23:44:02.000Z",
    "createdAt" : "2015-12-07T23:17:56.734Z",
    "updatedAt" : "2015-12-07T23:17:56.734Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 131,
      "username" : "User 182",
      "createdAt" : "2015-12-07T23:17:56.729Z",
      "updatedAt" : "2015-12-07T23:17:56.729Z",
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
  }
]
```
