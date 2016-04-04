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

<pre>Authorization: Token token=81QoJGI79WZ3ZIuuYi3PkW21X84
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/162/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/162/slots&quot; -X GET \
	-H &quot;Authorization: Token token=81QoJGI79WZ3ZIuuYi3PkW21X84&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f41436e4ce489ae2c5ba88c8f1fa2414&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95085340-c29f-46f1-a2b7-18e28e753435
X-Runtime: 0.027602
Vary: Origin
Content-Length: 953</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 63,
    "title" : "Slot title 126",
    "startDate" : "2019-09-22T09:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.335Z",
    "updatedAt" : "2016-04-04T20:50:34.335Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 165,
      "username" : "User 463",
      "createdAt" : "2016-04-04T20:50:34.330Z",
      "updatedAt" : "2016-04-04T20:50:34.330Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "foaf",
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 64,
    "title" : "Slot title 127",
    "startDate" : "2019-09-23T10:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.342Z",
    "updatedAt" : "2016-04-04T20:50:34.342Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 166,
      "username" : "User 464",
      "createdAt" : "2016-04-04T20:50:34.337Z",
      "updatedAt" : "2016-04-04T20:50:34.337Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
