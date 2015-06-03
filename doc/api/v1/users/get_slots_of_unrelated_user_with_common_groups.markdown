# Users API

## Get slots of unrelated user with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

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
Authorization: Token token=CEDQG3Rs292Rj45VZg1ny1OQoJk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/330/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/330/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CEDQG3Rs292Rj45VZg1ny1OQoJk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2f70c1356d005b3fd5cbea963041f329&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7cf9020f-dcc7-489d-bf9b-45c40e38f0f0
X-Runtime: 0.074036
Content-Length: 1994</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 79,
    "title" : "Slot title 68",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.047Z",
    "updatedAt" : "2015-06-03T10:39:41.047Z",
    "deletedAt" : null,
    "endDate" : "2014-10-15T20:44:02.000Z",
    "location" : {
      "id" : 72,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 335,
      "username" : "User 329",
      "createdAt" : "2015-06-03T10:39:41.038Z",
      "updatedAt" : "2015-06-03T10:39:41.038Z",
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
    "url" : "http://example.org/v1/slots/79"
  },
  {
    "id" : 81,
    "title" : "Slot title 70",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.067Z",
    "updatedAt" : "2015-06-03T10:39:41.091Z",
    "deletedAt" : null,
    "endDate" : "2014-10-17T22:44:02.000Z",
    "location" : {
      "id" : 74,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 340,
      "username" : "User 334",
      "createdAt" : "2015-06-03T10:39:41.070Z",
      "updatedAt" : "2015-06-03T10:39:41.070Z",
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
      "id" : 330
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/81"
  },
  {
    "id" : 83,
    "title" : "Slot title 72",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.108Z",
    "updatedAt" : "2015-06-03T10:39:41.108Z",
    "deletedAt" : null,
    "endDate" : "2014-10-19T00:44:02.000Z",
    "location" : {
      "id" : 76,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 345,
      "username" : "User 339",
      "createdAt" : "2015-06-03T10:39:41.093Z",
      "updatedAt" : "2015-06-03T10:39:41.093Z",
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
    "group" : {
      "id" : 48
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/83"
  }
]
```
