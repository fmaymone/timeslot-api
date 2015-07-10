# Users API

## Get slots for befriended user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39; or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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
Authorization: Token token=Mr6uq8BFv9X495rqtSOry07h38I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/272/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/272/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Mr6uq8BFv9X495rqtSOry07h38I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;db2b0a1b29c9b5fc1100e4f37a364978&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 27d20d44-1e8a-411f-aec3-6f25baa21e95
X-Runtime: 0.112546
Content-Length: 2317</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 72,
    "title" : "Slot title 61",
    "startDate" : "2019-09-08T13:44:02.000Z",
    "endDate" : "2019-10-08T13:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.188Z",
    "updatedAt" : "2015-07-02T12:34:26.188Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 274,
      "username" : "User 257",
      "createdAt" : "2015-07-02T12:34:26.183Z",
      "updatedAt" : "2015-07-02T12:34:26.183Z",
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
    "url" : "http://example.org/v1/slots/72"
  },
  {
    "id" : 73,
    "title" : "Slot title 62",
    "startDate" : "2019-09-09T14:44:02.000Z",
    "endDate" : "2019-10-09T14:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.197Z",
    "updatedAt" : "2015-07-02T12:34:26.197Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 275,
      "username" : "User 258",
      "createdAt" : "2015-07-02T12:34:26.191Z",
      "updatedAt" : "2015-07-02T12:34:26.191Z",
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
    "url" : "http://example.org/v1/slots/73"
  },
  {
    "id" : 75,
    "title" : "Slot title 64",
    "startDate" : "2019-09-11T16:44:02.000Z",
    "endDate" : "2019-10-11T16:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.212Z",
    "updatedAt" : "2015-07-02T12:34:26.233Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 278,
      "username" : "User 261",
      "createdAt" : "2015-07-02T12:34:26.215Z",
      "updatedAt" : "2015-07-02T12:34:26.215Z",
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
      "id" : 272
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/75"
  },
  {
    "id" : 77,
    "title" : "Slot title 66",
    "startDate" : "2019-09-13T18:44:02.000Z",
    "endDate" : "2019-10-13T18:44:02.000Z",
    "createdAt" : "2015-07-02T12:34:26.267Z",
    "updatedAt" : "2015-07-02T12:34:26.267Z",
    "deletedAt" : null,
    "openEnd" : false,
    "location" : null,
    "creator" : {
      "id" : 282,
      "username" : "User 265",
      "createdAt" : "2015-07-02T12:34:26.250Z",
      "updatedAt" : "2015-07-02T12:34:26.250Z",
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
      "id" : 46
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/77"
  }
]
```
