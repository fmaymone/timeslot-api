# Users API

## Get slots for Friend

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39;, &#39;foaf&#39; (friend-of-friend) or &#39;public&#39;, ReSlots &amp; shared GroupSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : id
Description : ID of the user to get the slots for.


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

<pre>Authorization: Token token=64l8KK4ZFPIdiOw2zjFhO5YLYJI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/174/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/174/slots&quot; -X GET \
	-H &quot;Authorization: Token token=64l8KK4ZFPIdiOw2zjFhO5YLYJI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3e71103144bdb7b2d64e09b25af44fd9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 44783368-496f-42da-b190-2ab13b31760b
X-Runtime: 0.048365
Vary: Origin
Content-Length: 2024</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 76,
    "title" : "Slot title 158",
    "startDate" : "2019-09-01T18:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:18.973Z",
    "updatedAt" : "2016-01-29T19:39:18.973Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 179,
      "username" : "User 512",
      "createdAt" : "2016-01-29T19:39:18.953Z",
      "updatedAt" : "2016-01-29T19:39:18.953Z",
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
      "id" : 174
    },
    "parent" : {
      "id" : 75
    },
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 72,
    "title" : "Slot title 155",
    "startDate" : "2019-09-25T15:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:18.930Z",
    "updatedAt" : "2016-01-29T19:39:18.930Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 176,
      "username" : "User 509",
      "createdAt" : "2016-01-29T19:39:18.923Z",
      "updatedAt" : "2016-01-29T19:39:18.923Z",
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
    "id" : 73,
    "title" : "Slot title 156",
    "startDate" : "2019-09-26T16:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:18.940Z",
    "updatedAt" : "2016-01-29T19:39:18.940Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 177,
      "username" : "User 510",
      "createdAt" : "2016-01-29T19:39:18.934Z",
      "updatedAt" : "2016-01-29T19:39:18.934Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "foaf",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 74,
    "title" : "Slot title 157",
    "startDate" : "2019-09-27T17:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:18.950Z",
    "updatedAt" : "2016-01-29T19:39:18.950Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 178,
      "username" : "User 511",
      "createdAt" : "2016-01-29T19:39:18.944Z",
      "updatedAt" : "2016-01-29T19:39:18.944Z",
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
  }
]
```
