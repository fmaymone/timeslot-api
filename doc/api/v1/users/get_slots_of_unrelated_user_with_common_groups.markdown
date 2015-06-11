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
Authorization: Token token=21jWi1y0Aph7W3z3z09LTdKuiao
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/265/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/265/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=21jWi1y0Aph7W3z3z09LTdKuiao&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bd456d920c72f940fa8860285f68f4a6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 42066e50-e4b3-4922-a2db-226892a8182f
X-Runtime: 0.101349
Content-Length: 1754</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 79,
    "title" : "Slot title 68",
    "startDate" : "2019-09-15T20:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.343Z",
    "updatedAt" : "2015-06-11T16:21:01.343Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 268,
      "username" : "User 262",
      "createdAt" : "2015-06-11T16:21:01.338Z",
      "updatedAt" : "2015-06-11T16:21:01.338Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
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
    "startDate" : "2019-09-17T22:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.355Z",
    "updatedAt" : "2015-06-11T16:21:01.372Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 271,
      "username" : "User 265",
      "createdAt" : "2015-06-11T16:21:01.358Z",
      "updatedAt" : "2015-06-11T16:21:01.358Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 265
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/81"
  },
  {
    "id" : 83,
    "title" : "Slot title 72",
    "startDate" : "2019-09-19T00:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.388Z",
    "updatedAt" : "2015-06-11T16:21:01.388Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 274,
      "username" : "User 268",
      "createdAt" : "2015-06-11T16:21:01.375Z",
      "updatedAt" : "2015-06-11T16:21:01.375Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
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
