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

<pre>Authorization: Token token=Iyk23UW_hmrr0Tpm3_Rt_DBJycM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/158/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/158/slots&quot; -X GET \
	-H &quot;Authorization: Token token=Iyk23UW_hmrr0Tpm3_Rt_DBJycM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;92386da346e64d21739deb246b3c844e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 69f56f59-63b0-4611-a523-a78d5684920b
X-Runtime: 0.046932
Vary: Origin
Content-Length: 2088</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 68,
    "title" : "Slot title 131",
    "startDate" : "2019-09-01T15:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.552Z",
    "updatedAt" : "2016-01-21T23:11:43.552Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 160,
      "username" : "User 460",
      "createdAt" : "2016-01-21T23:11:43.546Z",
      "updatedAt" : "2016-01-21T23:11:43.546Z",
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
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 69,
    "title" : "Slot title 132",
    "startDate" : "2019-09-02T16:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.560Z",
    "updatedAt" : "2016-01-21T23:11:43.560Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 161,
      "username" : "User 461",
      "createdAt" : "2016-01-21T23:11:43.555Z",
      "updatedAt" : "2016-01-21T23:11:43.555Z",
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
    "id" : 70,
    "title" : "Slot title 133",
    "startDate" : "2019-09-03T17:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.568Z",
    "updatedAt" : "2016-01-21T23:11:43.568Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 162,
      "username" : "User 462",
      "createdAt" : "2016-01-21T23:11:43.563Z",
      "updatedAt" : "2016-01-21T23:11:43.563Z",
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
    "id" : 72,
    "title" : "Slot title 134",
    "startDate" : "2019-09-04T18:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.591Z",
    "updatedAt" : "2016-01-21T23:11:43.591Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 163,
      "username" : "User 463",
      "createdAt" : "2016-01-21T23:11:43.572Z",
      "updatedAt" : "2016-01-21T23:11:43.572Z",
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
      "id" : 158
    },
    "parent" : {
      "id" : 71
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
