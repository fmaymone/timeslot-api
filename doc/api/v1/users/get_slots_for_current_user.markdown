# Users API

## Get slots for current user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots &amp; ReSlots

If a user is authenticated the slot settings (alerts) will be included.

The returned slots are ordered by startdate, enddate, id.

### Parameters

Name : limit
Description : Query parameter to limit the amount of slots returned. Default is 50. We need a maximum for this.

Name : pit
Description : Point-in-time. Query parameter to get slots relative to specific moment. Must be UTC. Default is Time.zone.now (on the server).

Name : status
Description : Query parameter to filter slots relative to a point-in-time. Must be one of [past, ongoing, upcoming, now, around, all].
Default is &#39;all&#39;. Now = ongoing + upcoming. TODO: around = ongoing + [upcoming + past] (equally filled until limit).


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
Authorization: Token token=atFPPKqL3hYhAWm3pRJ6xydKwu8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/341/slots?limit=20&amp;pit=2015-08-19T01%3A00%3A59.032Z&amp;status=all</pre>

#### Query Parameters

<pre>limit: 20
pit: 2015-08-19T01:00:59.032Z
status: all</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/341/slots?limit=20&amp;pit=2015-08-19T01%3A00%3A59.032Z&amp;status=all&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=atFPPKqL3hYhAWm3pRJ6xydKwu8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;683de5a4660964c08d66386a27866121&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4e4cff53-2a85-47ef-8ea8-6398ab75fe37
X-Runtime: 0.078295
Content-Length: 2266</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 105,
    "title" : "Slot title 94",
    "startDate" : "2019-09-14T22:44:02.000Z",
    "createdAt" : "2015-08-19T01:00:58.965Z",
    "updatedAt" : "2015-08-19T01:00:58.965Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 342,
      "username" : "User 338",
      "createdAt" : "2015-08-19T01:00:58.961Z",
      "updatedAt" : "2015-08-19T01:00:58.961Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/105"
  },
  {
    "id" : 106,
    "title" : "Slot title 95",
    "startDate" : "2019-09-15T23:44:02.000Z",
    "createdAt" : "2015-08-19T01:00:58.972Z",
    "updatedAt" : "2015-08-19T01:00:58.972Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 343,
      "username" : "User 339",
      "createdAt" : "2015-08-19T01:00:58.967Z",
      "updatedAt" : "2015-08-19T01:00:58.967Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/106"
  },
  {
    "id" : 108,
    "title" : "Slot title 97",
    "startDate" : "2019-09-17T01:44:02.000Z",
    "createdAt" : "2015-08-19T01:00:58.983Z",
    "updatedAt" : "2015-08-19T01:00:59.000Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 346,
      "username" : "User 342",
      "createdAt" : "2015-08-19T01:00:58.985Z",
      "updatedAt" : "2015-08-19T01:00:58.985Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 341
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/108"
  },
  {
    "id" : 111,
    "title" : "Slot title 100",
    "startDate" : "2019-09-20T04:44:02.000Z",
    "createdAt" : "2015-08-19T01:00:59.015Z",
    "updatedAt" : "2015-08-19T01:00:59.030Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 351,
      "username" : "User 347",
      "createdAt" : "2015-08-19T01:00:59.018Z",
      "updatedAt" : "2015-08-19T01:00:59.018Z",
      "deletedAt" : null,
      "image" : {
        "publicId" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 341
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/111"
  }
]
```
