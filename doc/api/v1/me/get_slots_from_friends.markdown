# Me API

## Get slots from friends

### GET /v1/me/friendslots

Returns an array which includes the public and friend-visible StandardSlots &amp; ReSlots of all friends from the current user

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
Authorization: Token token=mTveUqJ8cHP5hbzwTCl4rX1u_Jc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mTveUqJ8cHP5hbzwTCl4rX1u_Jc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ed7e95793152b69b03a05df06f1e5c87&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e792e0f4-ffbc-4531-bc34-0615fa7908f5
X-Runtime: 0.072568
Vary: Origin
Content-Length: 1701</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 23,
    "title" : "Slot title 39",
    "startDate" : "2019-09-16T18:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:12.378Z",
    "updatedAt" : "2015-11-17T23:46:12.378Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 122,
      "username" : "User 177",
      "createdAt" : "2015-11-17T23:46:12.360Z",
      "updatedAt" : "2015-11-17T23:46:12.360Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 120
    },
    "parent" : {
      "id" : 22
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/23"
  },
  {
    "id" : 24,
    "title" : "Slot title 41",
    "startDate" : "2019-09-18T20:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:12.397Z",
    "updatedAt" : "2015-11-17T23:46:12.397Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 126,
      "username" : "User 181",
      "createdAt" : "2015-11-17T23:46:12.388Z",
      "updatedAt" : "2015-11-17T23:46:12.388Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "friends",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/24"
  },
  {
    "id" : 25,
    "title" : "Slot title 42",
    "startDate" : "2019-09-19T21:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:12.419Z",
    "updatedAt" : "2015-11-17T23:46:12.419Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 129,
      "username" : "User 184",
      "createdAt" : "2015-11-17T23:46:12.415Z",
      "updatedAt" : "2015-11-17T23:46:12.415Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/25"
  }
]
```
