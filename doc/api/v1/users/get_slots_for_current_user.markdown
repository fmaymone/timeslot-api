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
Authorization: Token token=As6VYg230A073nTuimD1r7qfu4c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/219/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/219/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=As6VYg230A073nTuimD1r7qfu4c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;3789188fecad1eb895aae6ddc2102402&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 12e5b259-0a10-49d0-8be7-5d4918ce2db7
X-Runtime: 0.091113
Content-Length: 1643</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 58,
    "title" : "Slot title 50",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:39.893Z",
    "updatedAt" : "2015-05-06T21:29:39.893Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-24T02:44:02.000Z",
    "visibility" : "private",
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/58",
    "creatorId" : 220
  },
  {
    "id" : 59,
    "title" : "Slot title 51",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:39.899Z",
    "updatedAt" : "2015-05-06T21:29:39.899Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-25T03:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/59",
    "creatorId" : 221
  },
  {
    "id" : 61,
    "title" : "Slot title 53",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:39.908Z",
    "updatedAt" : "2015-05-06T21:29:39.921Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-27T05:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/61",
    "creatorId" : 224
  },
  {
    "id" : 64,
    "title" : "Slot title 56",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:39.932Z",
    "updatedAt" : "2015-05-06T21:29:39.956Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-03T08:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/64",
    "creatorId" : 229
  }
]
```
