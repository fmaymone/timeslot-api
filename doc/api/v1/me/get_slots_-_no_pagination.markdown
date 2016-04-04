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

<pre>Authorization: Token token=1ppowv9nKCkXvEiJntendB-Wn6o
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=1ppowv9nKCkXvEiJntendB-Wn6o&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;99943c14c20ad1b0531a0536716879b7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fbec65b9-0661-419a-813a-09eb385455f4
X-Runtime: 0.014513
Vary: Origin
Content-Length: 951</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 8,
    "title" : "Slot title 36",
    "startDate" : "2019-09-13T15:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:23.947Z",
    "updatedAt" : "2016-04-04T20:50:23.947Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 21,
      "username" : "User 183",
      "createdAt" : "2016-04-04T20:50:23.943Z",
      "updatedAt" : "2016-04-04T20:50:23.943Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 9,
    "title" : "Slot title 37",
    "startDate" : "2019-09-14T16:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:23.955Z",
    "updatedAt" : "2016-04-04T20:50:23.955Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 22,
      "username" : "User 184",
      "createdAt" : "2016-04-04T20:50:23.950Z",
      "updatedAt" : "2016-04-04T20:50:23.950Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
