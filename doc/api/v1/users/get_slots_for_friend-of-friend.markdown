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

<pre>Authorization: Token token=nH4q7yo9YR0o-PHOfFfToA-jSVg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/174/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/174/slots&quot; -X GET \
	-H &quot;Authorization: Token token=nH4q7yo9YR0o-PHOfFfToA-jSVg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aa7866f1a0331f23b9720bef7377cb24&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 61892bff-e7ab-47ff-ad17-3527f8fbc978
X-Runtime: 0.092365
Vary: Origin
Content-Length: 2232</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 79,
    "title" : "Slot title 135",
    "startDate" : "2019-09-05T19:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.636Z",
    "updatedAt" : "2015-11-17T23:46:18.636Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 177,
      "username" : "User 454",
      "createdAt" : "2015-11-17T23:46:18.632Z",
      "updatedAt" : "2015-11-17T23:46:18.632Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "foaf",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/79"
  },
  {
    "id" : 80,
    "title" : "Slot title 136",
    "startDate" : "2019-09-06T20:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.644Z",
    "updatedAt" : "2015-11-17T23:46:18.644Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 178,
      "username" : "User 455",
      "createdAt" : "2015-11-17T23:46:18.639Z",
      "updatedAt" : "2015-11-17T23:46:18.639Z",
      "deletedAt" : null,
      "image" : ""
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
    "url" : "http://example.org/v1/slots/80"
  },
  {
    "id" : 82,
    "title" : "Slot title 137",
    "startDate" : "2019-09-07T21:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.661Z",
    "updatedAt" : "2015-11-17T23:46:18.661Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 179,
      "username" : "User 456",
      "createdAt" : "2015-11-17T23:46:18.646Z",
      "updatedAt" : "2015-11-17T23:46:18.646Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 174
    },
    "parent" : {
      "id" : 81
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/82"
  },
  {
    "id" : 83,
    "title" : "Slot title 139",
    "startDate" : "2019-09-09T23:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.702Z",
    "updatedAt" : "2015-11-17T23:46:18.702Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 184,
      "username" : "User 461",
      "createdAt" : "2015-11-17T23:46:18.688Z",
      "updatedAt" : "2015-11-17T23:46:18.688Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "group" : {
      "id" : 16
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/83"
  }
]
```
