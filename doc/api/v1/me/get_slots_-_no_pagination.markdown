# Me API

## Get slots - no pagination

### GET /v1/me/slots

Returns an array which includes all StandardSlots &amp; ReSlots the current_user has created including the slot settings (alerts).

The slots are ordered by startdate, enddate, ID.

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

<pre>Authorization: Token token=OMlcBzCcFA0mpNEstPAOVORcEAo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=OMlcBzCcFA0mpNEstPAOVORcEAo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3e872015ae5b5759fd415bf4e28822bb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 132d6d21-930f-40a4-8cd6-25577fa598db
X-Runtime: 0.035513
Vary: Origin
Content-Length: 2060</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 12,
    "title" : "Slot title 39",
    "startDate" : "2019-09-16T18:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:00.802Z",
    "updatedAt" : "2016-01-29T19:39:00.802Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 99,
      "username" : "User 177",
      "createdAt" : "2016-01-29T19:39:00.796Z",
      "updatedAt" : "2016-01-29T19:39:00.796Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 13,
    "title" : "Slot title 40",
    "startDate" : "2019-09-17T19:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:00.812Z",
    "updatedAt" : "2016-01-29T19:39:00.812Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 100,
      "username" : "User 178",
      "createdAt" : "2016-01-29T19:39:00.806Z",
      "updatedAt" : "2016-01-29T19:39:00.806Z",
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
    "id" : 15,
    "title" : "Slot title 41",
    "startDate" : "2019-09-18T20:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:00.835Z",
    "updatedAt" : "2016-01-29T19:39:00.835Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 101,
      "username" : "User 179",
      "createdAt" : "2016-01-29T19:39:00.815Z",
      "updatedAt" : "2016-01-29T19:39:00.815Z",
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
      "id" : 98
    },
    "parent" : {
      "id" : 14
    },
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 17,
    "title" : "Slot title 43",
    "startDate" : "2019-09-20T22:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:00.889Z",
    "updatedAt" : "2016-01-29T19:39:00.889Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 104,
      "username" : "User 182",
      "createdAt" : "2016-01-29T19:39:00.871Z",
      "updatedAt" : "2016-01-29T19:39:00.871Z",
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
      "id" : 98
    },
    "parent" : {
      "id" : 16
    },
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
