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

<pre>Authorization: Token token=iSk-7XcquLZUbWvapkG4Let4xGc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/167/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/167/slots&quot; -X GET \
	-H &quot;Authorization: Token token=iSk-7XcquLZUbWvapkG4Let4xGc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;96ef3655b67d610e26a848a4905bb28d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 17273230-05be-442b-befd-70e9280ad16f
X-Runtime: 0.042650
Vary: Origin
Content-Length: 1575</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 75,
    "title" : "Slot title 138",
    "startDate" : "2019-09-08T22:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.731Z",
    "updatedAt" : "2016-01-21T23:11:43.731Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 170,
      "username" : "User 469",
      "createdAt" : "2016-01-21T23:11:43.727Z",
      "updatedAt" : "2016-01-21T23:11:43.727Z",
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
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 76,
    "title" : "Slot title 139",
    "startDate" : "2019-09-09T23:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.737Z",
    "updatedAt" : "2016-01-21T23:11:43.737Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 171,
      "username" : "User 470",
      "createdAt" : "2016-01-21T23:11:43.733Z",
      "updatedAt" : "2016-01-21T23:11:43.733Z",
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
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 78,
    "title" : "Slot title 140",
    "startDate" : "2019-09-10T00:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.755Z",
    "updatedAt" : "2016-01-21T23:11:43.755Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 172,
      "username" : "User 471",
      "createdAt" : "2016-01-21T23:11:43.740Z",
      "updatedAt" : "2016-01-21T23:11:43.740Z",
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
      "id" : 167
    },
    "parent" : {
      "id" : 77
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
