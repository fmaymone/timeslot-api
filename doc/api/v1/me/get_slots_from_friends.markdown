# Me API

## Get slots from friends

### GET /v1/me/friendslots

Returns an array which includes all non-private StandardSlots &amp; ReSlots from all friends of the current user.

This endpoint supports pagination in the same style as the &#39;/me/slots&#39; route.

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
Authorization: Token token=HgnhnNytuhCmHeiOAhUWO91ADQA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=HgnhnNytuhCmHeiOAhUWO91ADQA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a9e26f8a4a3337080f59542872d849c9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a31aefd2-0c77-4d65-9c36-9d85de740d59
X-Runtime: 0.039799
Vary: Origin
Content-Length: 2518</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 24,
    "title" : "Slot title 51",
    "startDate" : "2019-09-01T06:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:01.109Z",
    "updatedAt" : "2016-01-29T19:39:01.109Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 118,
      "username" : "User 196",
      "createdAt" : "2016-01-29T19:39:01.103Z",
      "updatedAt" : "2016-01-29T19:39:01.103Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 19,
    "title" : "Slot title 46",
    "startDate" : "2019-09-23T01:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:01.005Z",
    "updatedAt" : "2016-01-29T19:39:01.005Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 109,
      "username" : "User 187",
      "createdAt" : "2016-01-29T19:39:01.000Z",
      "updatedAt" : "2016-01-29T19:39:01.000Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 20,
    "title" : "Slot title 47",
    "startDate" : "2019-09-24T02:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:01.015Z",
    "updatedAt" : "2016-01-29T19:39:01.015Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 110,
      "username" : "User 188",
      "createdAt" : "2016-01-29T19:39:01.009Z",
      "updatedAt" : "2016-01-29T19:39:01.009Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 22,
    "title" : "Slot title 48",
    "startDate" : "2019-09-25T03:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:01.037Z",
    "updatedAt" : "2016-01-29T19:39:01.037Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 111,
      "username" : "User 189",
      "createdAt" : "2016-01-29T19:39:01.018Z",
      "updatedAt" : "2016-01-29T19:39:01.018Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 107
    },
    "parent" : {
      "id" : 21
    },
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 23,
    "title" : "Slot title 50",
    "startDate" : "2019-09-27T05:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:01.080Z",
    "updatedAt" : "2016-01-29T19:39:01.080Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 115,
      "username" : "User 193",
      "createdAt" : "2016-01-29T19:39:01.075Z",
      "updatedAt" : "2016-01-29T19:39:01.075Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
