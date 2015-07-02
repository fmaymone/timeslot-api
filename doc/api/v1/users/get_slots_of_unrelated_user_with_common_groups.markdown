# Users API

## Get slots of unrelated user with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

If a user is authenticated the slot settings (alerts) will be included.

### Response Fields

Name : id
Description : ID of the slot

Name : title
Description : Title of the slot

Name : startDate
Description : Startdate of the slot

Name : endDate
Description : Enddate of the slot

Name : openEnd
Description : OpenEnd Boolean Flag of the slot

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
Authorization: Token token=GCW7QoryforlEwRCeCBX1HztvIs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/286/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/286/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=GCW7QoryforlEwRCeCBX1HztvIs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e9eb8e92ab0377dd89bd8c7c266ed8f3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7eff331e-f975-47ed-ba0e-d5c75a1c1e9f
X-Runtime: 0.081745
Content-Length: 1736</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 81,
    "title" : "Slot title 70",
    "startDate" : "2019-09-17T22:44:02.000Z",
    "endDate" : "2019-10-17T22:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.464Z",
    "updatedAt" : "2015-07-02T12:34:26.464Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 289,
      "username" : "User 271",
      "createdAt" : "2015-07-02T12:34:26.458Z",
      "updatedAt" : "2015-07-02T12:34:26.458Z",
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
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/81"
  },
  {
    "id" : 83,
    "title" : "Slot title 72",
    "startDate" : "2019-09-19T00:44:02.000Z",
    "endDate" : "2019-10-19T00:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.479Z",
    "updatedAt" : "2015-07-02T12:34:26.499Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 292,
      "username" : "User 274",
      "createdAt" : "2015-07-02T12:34:26.483Z",
      "updatedAt" : "2015-07-02T12:34:26.483Z",
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
      "id" : 286
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/83"
  },
  {
    "id" : 85,
    "title" : "Slot title 74",
    "startDate" : "2019-09-21T02:44:02.000Z",
    "endDate" : "2019-10-21T02:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.517Z",
    "updatedAt" : "2015-07-02T12:34:26.517Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 295,
      "username" : "User 277",
      "createdAt" : "2015-07-02T12:34:26.503Z",
      "updatedAt" : "2015-07-02T12:34:26.503Z",
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
      "id" : 48
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/85"
  }
]
```
