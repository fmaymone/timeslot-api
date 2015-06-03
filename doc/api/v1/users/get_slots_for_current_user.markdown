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
Authorization: Token token=riFBgUlxZZ57FhfkAsXunk1wVL8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/287/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/287/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=riFBgUlxZZ57FhfkAsXunk1wVL8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9826b135e1a9683a43f216f25ca27fae&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6e5d4e61-3c00-4f3c-b0b7-988d1dfeaeeb
X-Runtime: 0.086721
Content-Length: 2665</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 61,
    "title" : "Slot title 50",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.563Z",
    "updatedAt" : "2015-06-03T10:39:40.563Z",
    "deletedAt" : null,
    "endDate" : "2014-10-24T02:44:02.000Z",
    "location" : {
      "id" : 54,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 288,
      "username" : "User 284",
      "createdAt" : "2015-06-03T10:39:40.551Z",
      "updatedAt" : "2015-06-03T10:39:40.551Z",
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
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/61"
  },
  {
    "id" : 62,
    "title" : "Slot title 51",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.574Z",
    "updatedAt" : "2015-06-03T10:39:40.574Z",
    "deletedAt" : null,
    "endDate" : "2014-10-25T03:44:02.000Z",
    "location" : {
      "id" : 55,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 290,
      "username" : "User 286",
      "createdAt" : "2015-06-03T10:39:40.566Z",
      "updatedAt" : "2015-06-03T10:39:40.566Z",
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
    "url" : "http://example.org/v1/slots/62"
  },
  {
    "id" : 64,
    "title" : "Slot title 53",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.594Z",
    "updatedAt" : "2015-06-03T10:39:40.619Z",
    "deletedAt" : null,
    "endDate" : "2014-10-27T05:44:02.000Z",
    "location" : {
      "id" : 57,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 295,
      "username" : "User 291",
      "createdAt" : "2015-06-03T10:39:40.597Z",
      "updatedAt" : "2015-06-03T10:39:40.597Z",
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
      "id" : 287
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/64"
  },
  {
    "id" : 67,
    "title" : "Slot title 56",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.635Z",
    "updatedAt" : "2015-06-03T10:39:40.658Z",
    "deletedAt" : null,
    "endDate" : "2014-10-03T08:44:02.000Z",
    "location" : {
      "id" : 60,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 303,
      "username" : "User 299",
      "createdAt" : "2015-06-03T10:39:40.637Z",
      "updatedAt" : "2015-06-03T10:39:40.637Z",
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
      "id" : 287
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/67"
  }
]
```
