# Users API

## Get slots for Stranger with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=77r8L7ntqx7QQ-vxwuL_PyBPvwY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/188/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/188/slots&quot; -X GET \
	-H &quot;Authorization: Token token=77r8L7ntqx7QQ-vxwuL_PyBPvwY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;03573ba9645495ac1b79708bc5318bf2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ebe7e10a-edac-4ad6-a37c-2d81fc13d6bb
X-Runtime: 0.048835
Vary: Origin
Content-Length: 1554</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 88,
    "title" : "Slot title 151",
    "startDate" : "2019-09-21T11:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:38.057Z",
    "updatedAt" : "2015-12-23T11:18:38.057Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 192,
      "username" : "User 482",
      "createdAt" : "2015-12-23T11:18:38.053Z",
      "updatedAt" : "2015-12-23T11:18:38.053Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 90,
    "title" : "Slot title 152",
    "startDate" : "2019-09-22T12:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:38.075Z",
    "updatedAt" : "2015-12-23T11:18:38.075Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 193,
      "username" : "User 483",
      "createdAt" : "2015-12-23T11:18:38.060Z",
      "updatedAt" : "2015-12-23T11:18:38.060Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 188
    },
    "parent" : {
      "id" : 89
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 91,
    "title" : "Slot title 154",
    "startDate" : "2019-09-24T14:44:02.000Z",
    "createdAt" : "2015-12-23T11:18:38.120Z",
    "updatedAt" : "2015-12-23T11:18:38.120Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 196,
      "username" : "User 486",
      "createdAt" : "2015-12-23T11:18:38.109Z",
      "updatedAt" : "2015-12-23T11:18:38.109Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "group" : {
      "id" : 18
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
