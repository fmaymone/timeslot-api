# Users API

## Get slots of unrelated user with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : limit
Description : Query parameter to limit the amount of slots returned. Default is 50. We need a maximum for this.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (on the server).

Name : status
Description : Query parameter to filter slots relative to a point-in-time. Must be one of [past, ongoing, upcoming, now, around, all].
Default is &#39;all&#39;. Now = ongoing + upcoming. TODO: around = ongoing + [upcoming + past] (equally filled until limit).


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

<pre>Accept: application/json
Authorization: Token token=vPXWOAUap8TDIFxdTmRV329vta0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/443/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/443/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=vPXWOAUap8TDIFxdTmRV329vta0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0ed17757daf7a5e366d97413e1998779&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 66b664dc-d9a1-48c6-afea-6c51ad33b075
X-Runtime: 0.074109
Vary: Origin
Content-Length: 1758</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 136,
    "title" : "Slot title 121",
    "startDate" : "2019-09-14T01:44:02.000Z",
    "createdAt" : "2015-10-03T22:30:47.481Z",
    "updatedAt" : "2015-10-03T22:30:47.481Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 446,
      "username" : "User 406",
      "createdAt" : "2015-10-03T22:30:47.477Z",
      "updatedAt" : "2015-10-03T22:30:47.477Z",
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
    "url" : "http://example.org/v1/slots/136"
  },
  {
    "id" : 138,
    "title" : "Slot title 123",
    "startDate" : "2019-09-16T03:44:02.000Z",
    "createdAt" : "2015-10-03T22:30:47.492Z",
    "updatedAt" : "2015-10-03T22:30:47.518Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 449,
      "username" : "User 409",
      "createdAt" : "2015-10-03T22:30:47.496Z",
      "updatedAt" : "2015-10-03T22:30:47.496Z",
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
    "slotter" : {
      "id" : 443
    },
    "parent" : {
      "id" : 139
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/138"
  },
  {
    "id" : 140,
    "title" : "Slot title 125",
    "startDate" : "2019-09-18T05:44:02.000Z",
    "createdAt" : "2015-10-03T22:30:47.532Z",
    "updatedAt" : "2015-10-03T22:30:47.532Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 452,
      "username" : "User 412",
      "createdAt" : "2015-10-03T22:30:47.520Z",
      "updatedAt" : "2015-10-03T22:30:47.520Z",
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
      "id" : 54
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/140"
  }
]
```
