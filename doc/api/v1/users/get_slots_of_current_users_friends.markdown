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
Authorization: Token token=qgpDKQIESURrhGixXAlQ5McRauw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=qgpDKQIESURrhGixXAlQ5McRauw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d5a99d1a3079c606c0b7cc06d6942f7f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6fc78688-c860-4dde-affa-3b6c2af785d3
X-Runtime: 0.096983
Content-Length: 1693</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 95,
    "title" : "Slot title 84",
    "startDate" : "2019-09-04T12:44:02.000Z",
    "createdAt" : "2015-06-22T08:44:29.794Z",
    "updatedAt" : "2015-06-22T08:44:29.812Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 297,
      "username" : "User 290",
      "createdAt" : "2015-06-22T08:44:29.797Z",
      "updatedAt" : "2015-06-22T08:44:29.797Z",
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
      "id" : 293
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/95"
  },
  {
    "id" : 97,
    "title" : "Slot title 86",
    "startDate" : "2019-09-06T14:44:02.000Z",
    "createdAt" : "2015-06-22T08:44:29.826Z",
    "updatedAt" : "2015-06-22T08:44:29.826Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 301,
      "username" : "User 294",
      "createdAt" : "2015-06-22T08:44:29.818Z",
      "updatedAt" : "2015-06-22T08:44:29.818Z",
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
    "url" : "http://example.org/v1/slots/97"
  },
  {
    "id" : 98,
    "title" : "Slot title 87",
    "startDate" : "2019-09-07T15:44:02.000Z",
    "createdAt" : "2015-06-22T08:44:29.916Z",
    "updatedAt" : "2015-06-22T08:44:29.916Z",
    "deletedAt" : null,
    "endDate" : "2019-10-07T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 304,
      "username" : "User 297",
      "createdAt" : "2015-06-22T08:44:29.911Z",
      "updatedAt" : "2015-06-22T08:44:29.911Z",
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
    "url" : "http://example.org/v1/slots/98"
  }
]
```
