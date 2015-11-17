# Users API

## Get slots for current user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots &amp; ReSlots

If a user is authenticated the slot settings (alerts) will be included.

The returned slots are ordered by startdate, enddate, id.

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

<pre>Authorization: Token token=oVa0-BE91RRKh0v-qO5Gvg1KKjc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/181/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/181/slots&quot; -X GET \
	-H &quot;Authorization: Token token=oVa0-BE91RRKh0v-qO5Gvg1KKjc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e118fa9852aa1f164fe88c16c9cd45f3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 721563db-68e0-4018-8946-f3b4d7a99fa3
X-Runtime: 0.070609
Vary: Origin
Content-Length: 2419</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 76,
    "title" : "Slot title 114",
    "startDate" : "2019-09-11T22:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.407Z",
    "updatedAt" : "2015-11-17T12:12:43.407Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 182,
      "username" : "User 426",
      "createdAt" : "2015-11-17T12:12:43.403Z",
      "updatedAt" : "2015-11-17T12:12:43.403Z",
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
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/76"
  },
  {
    "id" : 77,
    "title" : "Slot title 115",
    "startDate" : "2019-09-12T23:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.414Z",
    "updatedAt" : "2015-11-17T12:12:43.414Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 183,
      "username" : "User 427",
      "createdAt" : "2015-11-17T12:12:43.410Z",
      "updatedAt" : "2015-11-17T12:12:43.410Z",
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
    "url" : "http://example.org/v1/slots/77"
  },
  {
    "id" : 79,
    "title" : "Slot title 116",
    "startDate" : "2019-09-13T00:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.431Z",
    "updatedAt" : "2015-11-17T12:12:43.431Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 184,
      "username" : "User 428",
      "createdAt" : "2015-11-17T12:12:43.416Z",
      "updatedAt" : "2015-11-17T12:12:43.416Z",
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
      "id" : 181
    },
    "parent" : {
      "id" : 78
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/79"
  },
  {
    "id" : 81,
    "title" : "Slot title 118",
    "startDate" : "2019-09-15T02:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:43.448Z",
    "updatedAt" : "2015-11-17T12:12:43.448Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 187,
      "username" : "User 431",
      "createdAt" : "2015-11-17T12:12:43.435Z",
      "updatedAt" : "2015-11-17T12:12:43.435Z",
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
      "id" : 181
    },
    "parent" : {
      "id" : 80
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/81"
  }
]
```
