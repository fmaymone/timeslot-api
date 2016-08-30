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

<pre>Authorization: Token token=Yo9M0gPG9goN3Nc_rU6gcA9Z3RU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/158/slots</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/158/slots&quot; -X GET \
	-H &quot;Authorization: Token token=Yo9M0gPG9goN3Nc_rU6gcA9Z3RU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d0a81ddae2c27ad3d822c5b80e5364a6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 94950c6a-dbd5-4d6b-bee7-64d1ad8e29ea
X-Runtime: 0.056890
Content-Length: 1183</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 70,
    "title" : "Slot title 226",
    "description" : "",
    "startDate" : "2019-09-11T10:44:02.000Z",
    "createdAt" : "2016-08-30T09:51:12.245Z",
    "updatedAt" : "2016-08-30T09:51:12.245Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 158,
      "username" : "Joe",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:12.207Z",
      "updatedAt" : "2016-08-30T09:51:12.207Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "foaf",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  },
  {
    "id" : 71,
    "title" : "Slot title 227",
    "description" : "",
    "startDate" : "2019-09-12T11:44:02.000Z",
    "createdAt" : "2016-08-30T09:51:12.255Z",
    "updatedAt" : "2016-08-30T09:51:12.255Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 158,
      "username" : "Joe",
      "firstName" : null,
      "middleName" : null,
      "lastName" : null,
      "createdAt" : "2016-08-30T09:51:12.207Z",
      "updatedAt" : "2016-08-30T09:51:12.207Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "firstGroup" : null,
    "slotGroupUuids" : []
  }
]
```
