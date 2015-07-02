# Users API

## Get slots of current users friends

### GET /v1/users/friendslots

Returns an array which includes the public and friend-visible StandardSlots &amp; ReSlots of all friends from the current user

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
Authorization: Token token=mgb5WRCQpZrOBliavkpywi46FlA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mgb5WRCQpZrOBliavkpywi46FlA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8e3aafc9617638501e183e30071e7645&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 06ed3a93-f0b1-49f5-9272-784e09b2de21
X-Runtime: 0.089633
Content-Length: 1741</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 96,
    "title" : "Slot title 85",
    "startDate" : "2019-09-05T13:44:02.000Z",
    "endDate" : "2019-10-05T13:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.842Z",
    "updatedAt" : "2015-07-02T12:34:26.875Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 316,
      "username" : "User 297",
      "createdAt" : "2015-07-02T12:34:26.845Z",
      "updatedAt" : "2015-07-02T12:34:26.845Z",
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
      "id" : 312
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/96"
  },
  {
    "id" : 98,
    "title" : "Slot title 87",
    "startDate" : "2019-09-07T15:44:02.000Z",
    "endDate" : "2019-10-07T15:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.889Z",
    "updatedAt" : "2015-07-02T12:34:26.889Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 320,
      "username" : "User 301",
      "createdAt" : "2015-07-02T12:34:26.882Z",
      "updatedAt" : "2015-07-02T12:34:26.882Z",
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
    "visibility" : "friends",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/98"
  },
  {
    "id" : 99,
    "title" : "Slot title 88",
    "startDate" : "2019-09-08T16:44:02.000Z",
    "endDate" : "2019-10-08T16:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.912Z",
    "updatedAt" : "2015-07-02T12:34:26.912Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 323,
      "username" : "User 304",
      "createdAt" : "2015-07-02T12:34:26.906Z",
      "updatedAt" : "2015-07-02T12:34:26.906Z",
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
    "url" : "http://example.org/v1/slots/99"
  }
]
```
