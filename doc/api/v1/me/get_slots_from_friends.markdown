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
Authorization: Token token=I1B1YTFqCpmNFucV1_Ll63dqDQE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=I1B1YTFqCpmNFucV1_Ll63dqDQE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ef626fa03cfa7aa908da2c6d2de36b49&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1f190aad-1c1d-4920-802f-262e3a4c91f9
X-Runtime: 0.029942
Vary: Origin
Content-Length: 2598</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 15,
    "title" : "Slot title 42",
    "startDate" : "2019-09-19T21:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.944Z",
    "updatedAt" : "2016-01-21T23:11:37.944Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 106,
      "username" : "User 184",
      "createdAt" : "2016-01-21T23:11:37.935Z",
      "updatedAt" : "2016-01-21T23:11:37.935Z",
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
    "id" : 16,
    "title" : "Slot title 43",
    "startDate" : "2019-09-20T22:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.955Z",
    "updatedAt" : "2016-01-21T23:11:37.955Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 107,
      "username" : "User 185",
      "createdAt" : "2016-01-21T23:11:37.948Z",
      "updatedAt" : "2016-01-21T23:11:37.948Z",
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
    "id" : 18,
    "title" : "Slot title 44",
    "startDate" : "2019-09-21T23:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:37.980Z",
    "updatedAt" : "2016-01-21T23:11:37.980Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 108,
      "username" : "User 186",
      "createdAt" : "2016-01-21T23:11:37.960Z",
      "updatedAt" : "2016-01-21T23:11:37.960Z",
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
      "id" : 104
    },
    "parent" : {
      "id" : 17
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 19,
    "title" : "Slot title 46",
    "startDate" : "2019-09-23T01:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:38.012Z",
    "updatedAt" : "2016-01-21T23:11:38.012Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 112,
      "username" : "User 190",
      "createdAt" : "2016-01-21T23:11:38.008Z",
      "updatedAt" : "2016-01-21T23:11:38.008Z",
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
    "id" : 20,
    "title" : "Slot title 47",
    "startDate" : "2019-09-24T02:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:38.032Z",
    "updatedAt" : "2016-01-21T23:11:38.032Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 115,
      "username" : "User 193",
      "createdAt" : "2016-01-21T23:11:38.029Z",
      "updatedAt" : "2016-01-21T23:11:38.029Z",
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
