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
Authorization: Token token=w8PY4Lk77M-IXu1GclKFWiYWhOE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/429/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/429/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=w8PY4Lk77M-IXu1GclKFWiYWhOE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d55320b625c8cf10d52a7b3e4bce21de&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 28bdb325-cae6-45c9-a4a0-83421dc0a765
X-Runtime: 0.119915
Vary: Origin
Content-Length: 1734</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 129,
    "title" : "Slot title 116",
    "startDate" : "2019-09-09T20:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.112Z",
    "updatedAt" : "2015-09-14T10:33:06.112Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 432,
      "username" : "User 394",
      "createdAt" : "2015-09-14T10:33:06.107Z",
      "updatedAt" : "2015-09-14T10:33:06.107Z",
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
    "url" : "http://example.org/v1/slots/129"
  },
  {
    "id" : 131,
    "title" : "Slot title 118",
    "startDate" : "2019-09-11T22:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.124Z",
    "updatedAt" : "2015-09-14T10:33:06.150Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 429,
      "username" : "Joe",
      "createdAt" : "2015-09-14T10:33:06.080Z",
      "updatedAt" : "2015-09-14T10:33:06.080Z",
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
      "id" : 429
    },
    "parent" : {
      "id" : 132
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/131"
  },
  {
    "id" : 133,
    "title" : "Slot title 120",
    "startDate" : "2019-09-13T00:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.166Z",
    "updatedAt" : "2015-09-14T10:33:06.166Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 438,
      "username" : "User 400",
      "createdAt" : "2015-09-14T10:33:06.153Z",
      "updatedAt" : "2015-09-14T10:33:06.153Z",
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
    "url" : "http://example.org/v1/slots/133"
  }
]
```
