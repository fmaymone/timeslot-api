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

<pre>Authorization: Token token=xqRuFaGxSBbGFYvlPZ1kk19noC8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/156/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/156/slots&quot; -X GET \
	-H &quot;Authorization: Token token=xqRuFaGxSBbGFYvlPZ1kk19noC8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;71d4009adf81aa9818b1de9c21e144ab&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 35581a1b-4cc7-4089-9af1-15223e830364
X-Runtime: 0.024090
Vary: Origin
Content-Length: 1431</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 58,
    "title" : "Slot title 121",
    "startDate" : "2019-09-17T04:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.244Z",
    "updatedAt" : "2016-04-04T20:50:34.244Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 158,
      "username" : "User 457",
      "createdAt" : "2016-04-04T20:50:34.239Z",
      "updatedAt" : "2016-04-04T20:50:34.239Z",
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
  },
  {
    "id" : 59,
    "title" : "Slot title 122",
    "startDate" : "2019-09-18T05:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.253Z",
    "updatedAt" : "2016-04-04T20:50:34.253Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 159,
      "username" : "User 458",
      "createdAt" : "2016-04-04T20:50:34.247Z",
      "updatedAt" : "2016-04-04T20:50:34.247Z",
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
    "id" : 60,
    "title" : "Slot title 123",
    "startDate" : "2019-09-19T06:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:34.260Z",
    "updatedAt" : "2016-04-04T20:50:34.260Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 160,
      "username" : "User 459",
      "createdAt" : "2016-04-04T20:50:34.255Z",
      "updatedAt" : "2016-04-04T20:50:34.255Z",
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
