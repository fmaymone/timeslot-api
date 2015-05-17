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
Authorization: Token token=Bd7xjPtwsf8S_A8iaYa2ygIetHQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Bd7xjPtwsf8S_A8iaYa2ygIetHQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;0aa0282958ff49f168139d30e2b9a4a4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e74e6b49-a8b7-4f5d-9cca-bed43a6d94e6
X-Runtime: 0.084557
Content-Length: 1234</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 91,
    "title" : "Slot title 83",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:40.811Z",
    "updatedAt" : "2015-05-06T21:29:40.822Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-03T11:44:02.000Z",
    "visibility" : null,
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/91",
    "creatorId" : 276
  },
  {
    "id" : 93,
    "title" : "Slot title 85",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:40.907Z",
    "updatedAt" : "2015-05-06T21:29:40.907Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-05T13:44:02.000Z",
    "visibility" : "friends",
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/93",
    "creatorId" : 281
  },
  {
    "id" : 94,
    "title" : "Slot title 86",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:40.920Z",
    "updatedAt" : "2015-05-06T21:29:40.920Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-06T14:44:02.000Z",
    "visibility" : "public",
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/94",
    "creatorId" : 283
  }
]
```
