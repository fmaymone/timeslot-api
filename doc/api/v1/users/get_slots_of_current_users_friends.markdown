# Users API

## Get slots of current users friends

### GET /v1/users/friendslots

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

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

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
Authorization: Token token=YFFvXc8XMjt7VhAstq-Spbqw_Ic
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=YFFvXc8XMjt7VhAstq-Spbqw_Ic&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b0dfebe8ee48a84fa48f34d34e4b4ac2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fc133402-9d6a-413f-afb8-c19263683d4d
X-Runtime: 0.076564
Content-Length: 1999</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 94,
    "title" : "Slot title 83",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.442Z",
    "updatedAt" : "2015-06-03T10:39:41.479Z",
    "deletedAt" : null,
    "endDate" : "2014-10-03T11:44:02.000Z",
    "location" : {
      "id" : 87,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 377,
      "username" : "User 370",
      "createdAt" : "2015-06-03T10:39:41.446Z",
      "updatedAt" : "2015-06-03T10:39:41.446Z",
      "deletedAt" : null,
      "image" : null
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 371
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/94"
  },
  {
    "id" : 96,
    "title" : "Slot title 85",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.509Z",
    "updatedAt" : "2015-06-03T10:39:41.509Z",
    "deletedAt" : null,
    "endDate" : "2014-10-05T13:44:02.000Z",
    "location" : {
      "id" : 89,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 384,
      "username" : "User 377",
      "createdAt" : "2015-06-03T10:39:41.499Z",
      "updatedAt" : "2015-06-03T10:39:41.499Z",
      "deletedAt" : null,
      "image" : null
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/96"
  },
  {
    "id" : 97,
    "title" : "Slot title 86",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.529Z",
    "updatedAt" : "2015-06-03T10:39:41.529Z",
    "deletedAt" : null,
    "endDate" : "2014-10-06T14:44:02.000Z",
    "location" : {
      "id" : 90,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 387,
      "username" : "User 380",
      "createdAt" : "2015-06-03T10:39:41.519Z",
      "updatedAt" : "2015-06-03T10:39:41.519Z",
      "deletedAt" : null,
      "image" : null
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/97"
  }
]
```
