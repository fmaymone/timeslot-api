# Users API

## Get slots for befriended user

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

<pre>Authorization: Token token=WtrQD6eyxXqYNQRlV040-FAzllU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/203/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/203/slots&quot; -X GET \
	-H &quot;Authorization: Token token=WtrQD6eyxXqYNQRlV040-FAzllU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5e836f2fbc716553b2dab573e9316486&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: afbf025c-03d4-4aad-804d-b64f52d17fc2
X-Runtime: 0.089968
Vary: Origin
Content-Length: 2352</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 93,
    "title" : "Slot title 131",
    "startDate" : "2019-09-01T15:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.797Z",
    "updatedAt" : "2015-11-17T12:12:43.797Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 207,
      "username" : "User 449",
      "createdAt" : "2015-11-17T12:12:43.793Z",
      "updatedAt" : "2015-11-17T12:12:43.793Z",
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
    "url" : "http://example.org/v1/slots/93"
  },
  {
    "id" : 95,
    "title" : "Slot title 132",
    "startDate" : "2019-09-02T16:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.814Z",
    "updatedAt" : "2015-11-17T12:12:43.814Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 208,
      "username" : "User 450",
      "createdAt" : "2015-11-17T12:12:43.800Z",
      "updatedAt" : "2015-11-17T12:12:43.800Z",
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
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 203
    },
    "parent" : {
      "id" : 94
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/95"
  },
  {
    "id" : 96,
    "title" : "Slot title 134",
    "startDate" : "2019-09-04T18:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.848Z",
    "updatedAt" : "2015-11-17T12:12:43.848Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 213,
      "username" : "User 455",
      "createdAt" : "2015-11-17T12:12:43.837Z",
      "updatedAt" : "2015-11-17T12:12:43.837Z",
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
      "id" : 12
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/96"
  },
  {
    "id" : 92,
    "title" : "Slot title 130",
    "startDate" : "2019-09-27T14:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.791Z",
    "updatedAt" : "2015-11-17T12:12:43.791Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 206,
      "username" : "User 448",
      "createdAt" : "2015-11-17T12:12:43.786Z",
      "updatedAt" : "2015-11-17T12:12:43.786Z",
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
    "visibility" : "foaf",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/92"
  }
]
```
