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
Authorization: Token token=1eBmY3zTpNPqjcDoafcrr6F7NxY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1eBmY3zTpNPqjcDoafcrr6F7NxY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;83722057014e941da6fd28e92d6591bc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ea1f64f9-9d09-4a36-8878-1501bba07cbe
X-Runtime: 0.123556
Content-Length: 1759</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 94,
    "title" : "Slot title 83",
    "startDate" : "2019-09-03T11:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.849Z",
    "updatedAt" : "2015-06-11T16:21:01.866Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 295,
      "username" : "User 288",
      "createdAt" : "2015-06-11T16:21:01.852Z",
      "updatedAt" : "2015-06-11T16:21:01.852Z",
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
      "id" : 291
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/94"
  },
  {
    "id" : 96,
    "title" : "Slot title 85",
    "startDate" : "2019-09-05T13:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.876Z",
    "updatedAt" : "2015-06-11T16:21:01.876Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 299,
      "username" : "User 292",
      "createdAt" : "2015-06-11T16:21:01.871Z",
      "updatedAt" : "2015-06-11T16:21:01.871Z",
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
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/96"
  },
  {
    "id" : 97,
    "title" : "Slot title 86",
    "startDate" : "2019-09-06T14:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.963Z",
    "updatedAt" : "2015-06-11T16:21:01.963Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 302,
      "username" : "User 295",
      "createdAt" : "2015-06-11T16:21:01.958Z",
      "updatedAt" : "2015-06-11T16:21:01.958Z",
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
    "url" : "http://example.org/v1/slots/97"
  }
]
```
