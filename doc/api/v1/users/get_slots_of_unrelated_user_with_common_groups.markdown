# Users API

## Get slots of unrelated user with common groups

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

<pre>Authorization: Token token=h-ugEqBGntmmZs4YxprVcq968YA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/217/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/217/slots&quot; -X GET \
	-H &quot;Authorization: Token token=h-ugEqBGntmmZs4YxprVcq968YA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;42f98a26436c83bb12e536b4313d2f33&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dedcc629-4f89-479f-b6e2-f87a9328de5d
X-Runtime: 0.068093
Vary: Origin
Content-Length: 1777</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 101,
    "title" : "Slot title 139",
    "startDate" : "2019-09-09T23:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:44.006Z",
    "updatedAt" : "2015-11-17T12:12:44.006Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 221,
      "username" : "User 462",
      "createdAt" : "2015-11-17T12:12:44.002Z",
      "updatedAt" : "2015-11-17T12:12:44.002Z",
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
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/101"
  },
  {
    "id" : 103,
    "title" : "Slot title 140",
    "startDate" : "2019-09-10T00:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:44.026Z",
    "updatedAt" : "2015-11-17T12:12:44.026Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 222,
      "username" : "User 463",
      "createdAt" : "2015-11-17T12:12:44.009Z",
      "updatedAt" : "2015-11-17T12:12:44.009Z",
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
      "id" : 217
    },
    "parent" : {
      "id" : 102
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/103"
  },
  {
    "id" : 104,
    "title" : "Slot title 142",
    "startDate" : "2019-09-12T02:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:44.043Z",
    "updatedAt" : "2015-11-17T12:12:44.043Z",
    "deletedAt" : null,
    "endDate" : "2019-10-12T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 225,
      "username" : "User 466",
      "createdAt" : "2015-11-17T12:12:44.030Z",
      "updatedAt" : "2015-11-17T12:12:44.030Z",
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
    "group" : {
      "id" : 14
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/104"
  }
]
```
