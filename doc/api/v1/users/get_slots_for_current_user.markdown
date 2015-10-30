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

<pre>Authorization: Token token=94s44BwxtupKbctWReZQQ4RYpvk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/197/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/197/slots&quot; -X GET \
	-H &quot;Authorization: Token token=94s44BwxtupKbctWReZQQ4RYpvk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;14685090996b997b84953e94f5b7c326&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: feb0c86f-0ae4-401c-a4e9-12eb09a42f81
X-Runtime: 0.081672
Vary: Origin
Content-Length: 2419</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 84,
    "title" : "Slot title 117",
    "startDate" : "2019-09-14T01:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.305Z",
    "updatedAt" : "2015-10-30T15:01:08.305Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 198,
      "username" : "User 418",
      "createdAt" : "2015-10-30T15:01:08.301Z",
      "updatedAt" : "2015-10-30T15:01:08.301Z",
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
    "url" : "http://example.org/v1/slots/84"
  },
  {
    "id" : 85,
    "title" : "Slot title 118",
    "startDate" : "2019-09-15T02:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.312Z",
    "updatedAt" : "2015-10-30T15:01:08.312Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 199,
      "username" : "User 419",
      "createdAt" : "2015-10-30T15:01:08.308Z",
      "updatedAt" : "2015-10-30T15:01:08.308Z",
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
    "url" : "http://example.org/v1/slots/85"
  },
  {
    "id" : 87,
    "title" : "Slot title 119",
    "startDate" : "2019-09-16T03:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.328Z",
    "updatedAt" : "2015-10-30T15:01:08.328Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 200,
      "username" : "User 420",
      "createdAt" : "2015-10-30T15:01:08.314Z",
      "updatedAt" : "2015-10-30T15:01:08.314Z",
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
      "id" : 197
    },
    "parent" : {
      "id" : 86
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/87"
  },
  {
    "id" : 89,
    "title" : "Slot title 121",
    "startDate" : "2019-09-18T05:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.346Z",
    "updatedAt" : "2015-10-30T15:01:08.346Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 203,
      "username" : "User 423",
      "createdAt" : "2015-10-30T15:01:08.333Z",
      "updatedAt" : "2015-10-30T15:01:08.333Z",
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
      "id" : 197
    },
    "parent" : {
      "id" : 88
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/89"
  }
]
```
