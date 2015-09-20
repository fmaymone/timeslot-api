# Users API

## Get slots for befriended user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39; or &#39;public&#39;, ReSlots &amp; shared GroupSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : limit
Description : Query parameter to limit the amount of slots returned. Default is 50. We need a maximum for this.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (on the server).

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
Authorization: Token token=rntsfMe3NsV3Tr8aF7K9s26Zu6E
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/429/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/429/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=rntsfMe3NsV3Tr8aF7K9s26Zu6E&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e249a403bad4a6403c7424ce9d96c312&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 088a8956-2a90-4c54-bdb6-016d902d2e70
X-Runtime: 0.167612
Vary: Origin
Content-Length: 2345</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 127,
    "title" : "Slot title 112",
    "startDate" : "2019-09-05T16:44:02.000Z",
    "createdAt" : "2015-09-20T18:49:45.334Z",
    "updatedAt" : "2015-09-20T18:49:45.334Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 431,
      "username" : "User 392",
      "createdAt" : "2015-09-20T18:49:45.329Z",
      "updatedAt" : "2015-09-20T18:49:45.329Z",
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
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/127"
  },
  {
    "id" : 128,
    "title" : "Slot title 113",
    "startDate" : "2019-09-06T17:44:02.000Z",
    "createdAt" : "2015-09-20T18:49:45.342Z",
    "updatedAt" : "2015-09-20T18:49:45.342Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 432,
      "username" : "User 393",
      "createdAt" : "2015-09-20T18:49:45.337Z",
      "updatedAt" : "2015-09-20T18:49:45.337Z",
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
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/128"
  },
  {
    "id" : 130,
    "title" : "Slot title 115",
    "startDate" : "2019-09-08T19:44:02.000Z",
    "createdAt" : "2015-09-20T18:49:45.366Z",
    "updatedAt" : "2015-09-20T18:49:45.385Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 435,
      "username" : "User 396",
      "createdAt" : "2015-09-20T18:49:45.371Z",
      "updatedAt" : "2015-09-20T18:49:45.371Z",
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
      "id" : 429
    },
    "parent" : {
      "id" : 131
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/130"
  },
  {
    "id" : 132,
    "title" : "Slot title 117",
    "startDate" : "2019-09-10T21:44:02.000Z",
    "createdAt" : "2015-09-20T18:49:45.480Z",
    "updatedAt" : "2015-09-20T18:49:45.480Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 439,
      "username" : "User 400",
      "createdAt" : "2015-09-20T18:49:45.468Z",
      "updatedAt" : "2015-09-20T18:49:45.468Z",
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
    "group" : {
      "id" : 52
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/132"
  }
]
```
