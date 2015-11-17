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

<pre>Authorization: Token token=0unbA5DbH7vhVuUmOd4FQVZzzF8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/161/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/161/slots&quot; -X GET \
	-H &quot;Authorization: Token token=0unbA5DbH7vhVuUmOd4FQVZzzF8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;de4aa8cc5078e756ae04cfce4ba2373d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fd63b78f-e410-47c5-a624-4bb30fb623da
X-Runtime: 0.092907
Vary: Origin
Content-Length: 2787</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 75,
    "title" : "Slot title 131",
    "startDate" : "2019-09-01T15:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.485Z",
    "updatedAt" : "2015-11-17T23:46:18.485Z",
    "deletedAt" : null,
    "endDate" : "2019-10-01T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 170,
      "username" : "User 448",
      "createdAt" : "2015-11-17T23:46:18.475Z",
      "updatedAt" : "2015-11-17T23:46:18.475Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "group" : {
      "id" : 14
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/75"
  },
  {
    "id" : 70,
    "title" : "Slot title 126",
    "startDate" : "2019-09-23T10:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.423Z",
    "updatedAt" : "2015-11-17T23:46:18.423Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 163,
      "username" : "User 441",
      "createdAt" : "2015-11-17T23:46:18.419Z",
      "updatedAt" : "2015-11-17T23:46:18.419Z",
      "deletedAt" : null,
      "image" : ""
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
    "url" : "http://example.org/v1/slots/70"
  },
  {
    "id" : 71,
    "title" : "Slot title 127",
    "startDate" : "2019-09-24T11:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.430Z",
    "updatedAt" : "2015-11-17T23:46:18.430Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 164,
      "username" : "User 442",
      "createdAt" : "2015-11-17T23:46:18.426Z",
      "updatedAt" : "2015-11-17T23:46:18.426Z",
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
    "url" : "http://example.org/v1/slots/71"
  },
  {
    "id" : 72,
    "title" : "Slot title 128",
    "startDate" : "2019-09-25T12:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.437Z",
    "updatedAt" : "2015-11-17T23:46:18.437Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 165,
      "username" : "User 443",
      "createdAt" : "2015-11-17T23:46:18.432Z",
      "updatedAt" : "2015-11-17T23:46:18.432Z",
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
    "url" : "http://example.org/v1/slots/72"
  },
  {
    "id" : 74,
    "title" : "Slot title 129",
    "startDate" : "2019-09-26T13:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.456Z",
    "updatedAt" : "2015-11-17T23:46:18.456Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 166,
      "username" : "User 444",
      "createdAt" : "2015-11-17T23:46:18.439Z",
      "updatedAt" : "2015-11-17T23:46:18.439Z",
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
      "id" : 161
    },
    "parent" : {
      "id" : 73
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/74"
  }
]
```
