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
Authorization: Token token=h4xq92gPfaSKIR9NIJmyxV1ftNE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/308/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/308/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=h4xq92gPfaSKIR9NIJmyxV1ftNE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dad0acdce19b95f1c090c6a9adca64ff&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e3873d93-b968-4c3a-a46b-03b9b65a3109
X-Runtime: 0.094983
Content-Length: 2661</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 70,
    "title" : "Slot title 59",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.793Z",
    "updatedAt" : "2015-06-03T10:39:40.793Z",
    "deletedAt" : null,
    "endDate" : "2014-10-06T11:44:02.000Z",
    "location" : {
      "id" : 63,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 311,
      "username" : "User 306",
      "createdAt" : "2015-06-03T10:39:40.785Z",
      "updatedAt" : "2015-06-03T10:39:40.785Z",
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
    "url" : "http://example.org/v1/slots/70"
  },
  {
    "id" : 71,
    "title" : "Slot title 60",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.805Z",
    "updatedAt" : "2015-06-03T10:39:40.805Z",
    "deletedAt" : null,
    "endDate" : "2014-10-07T12:44:02.000Z",
    "location" : {
      "id" : 64,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 313,
      "username" : "User 308",
      "createdAt" : "2015-06-03T10:39:40.796Z",
      "updatedAt" : "2015-06-03T10:39:40.796Z",
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
    "url" : "http://example.org/v1/slots/71"
  },
  {
    "id" : 73,
    "title" : "Slot title 62",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.821Z",
    "updatedAt" : "2015-06-03T10:39:40.849Z",
    "deletedAt" : null,
    "endDate" : "2014-10-09T14:44:02.000Z",
    "location" : {
      "id" : 66,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 318,
      "username" : "User 313",
      "createdAt" : "2015-06-03T10:39:40.824Z",
      "updatedAt" : "2015-06-03T10:39:40.824Z",
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
      "id" : 308
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/73"
  },
  {
    "id" : 75,
    "title" : "Slot title 64",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:40.876Z",
    "updatedAt" : "2015-06-03T10:39:40.876Z",
    "deletedAt" : null,
    "endDate" : "2014-10-11T16:44:02.000Z",
    "location" : {
      "id" : 68,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 324,
      "username" : "User 319",
      "createdAt" : "2015-06-03T10:39:40.860Z",
      "updatedAt" : "2015-06-03T10:39:40.860Z",
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
      "id" : 46
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/75"
  }
]
```
