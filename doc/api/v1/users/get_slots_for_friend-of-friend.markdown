# Users API

## Get slots for Friend-of-Friend

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;foaf&#39; (friend-of-friend) or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=9yAO4BSp154PU7vef8ijtQBBIII
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/183/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/183/slots&quot; -X GET \
	-H &quot;Authorization: Token token=9yAO4BSp154PU7vef8ijtQBBIII&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;29c2c9510cce58122a8991d27c2e0302&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cbb67a05-174e-4ea5-bd2a-ca085da193ad
X-Runtime: 0.058646
Vary: Origin
Content-Length: 1527</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 79,
    "title" : "Slot title 162",
    "startDate" : "2019-09-05T22:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.125Z",
    "updatedAt" : "2016-01-29T19:39:19.125Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 186,
      "username" : "User 518",
      "createdAt" : "2016-01-29T19:39:19.119Z",
      "updatedAt" : "2016-01-29T19:39:19.119Z",
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
    "id" : 80,
    "title" : "Slot title 163",
    "startDate" : "2019-09-06T23:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.135Z",
    "updatedAt" : "2016-01-29T19:39:19.135Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 187,
      "username" : "User 519",
      "createdAt" : "2016-01-29T19:39:19.129Z",
      "updatedAt" : "2016-01-29T19:39:19.129Z",
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
    "id" : 82,
    "title" : "Slot title 164",
    "startDate" : "2019-09-07T00:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.158Z",
    "updatedAt" : "2016-01-29T19:39:19.158Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 188,
      "username" : "User 520",
      "createdAt" : "2016-01-29T19:39:19.138Z",
      "updatedAt" : "2016-01-29T19:39:19.138Z",
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
      "id" : 183
    },
    "parent" : {
      "id" : 81
    },
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
