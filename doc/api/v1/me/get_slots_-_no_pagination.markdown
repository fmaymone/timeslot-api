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

<pre>Authorization: Token token=J0lcuyeVjNIDpRb7Z5xh56c9Dcw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=J0lcuyeVjNIDpRb7Z5xh56c9Dcw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b4086415ec7daa81cfecb92204cf1f48&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1a7f9626-b94f-465f-a81c-848c81b5dbe7
X-Runtime: 0.038095
Content-Length: 1193</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 8,
    "title" : "Slot title 124",
    "description" : "",
    "startDate" : "2019-09-17T04:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:53.566Z",
    "updatedAt" : "2016-08-30T09:50:53.566Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 23,
      "username" : "User 561",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:53.556Z",
      "updatedAt" : "2016-08-30T09:50:53.556Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  },
  {
    "id" : 9,
    "title" : "Slot title 125",
    "description" : "",
    "startDate" : "2019-09-18T05:44:02.000Z",
    "createdAt" : "2016-08-30T09:50:53.577Z",
    "updatedAt" : "2016-08-30T09:50:53.577Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 23,
      "username" : "User 561",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:50:53.556Z",
      "updatedAt" : "2016-08-30T09:50:53.556Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
