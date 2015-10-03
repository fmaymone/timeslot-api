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
Authorization: Token token=hRl31Rs8mwBOzHfOy6EWTzmS3rA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=hRl31Rs8mwBOzHfOy6EWTzmS3rA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;54b59b793f40d193b3566e534f87d59c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 16511aba-7a67-4444-804e-5f9079147fe5
X-Runtime: 0.068175
Vary: Origin
Content-Length: 1782</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 151,
    "title" : "Slot title 136",
    "startDate" : "2019-09-02T16:44:02.000Z",
    "createdAt" : "2015-10-03T22:30:47.829Z",
    "updatedAt" : "2015-10-03T22:30:47.843Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 473,
      "username" : "User 432",
      "createdAt" : "2015-10-03T22:30:47.831Z",
      "updatedAt" : "2015-10-03T22:30:47.831Z",
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
      "id" : 469
    },
    "parent" : {
      "id" : 152
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/151"
  },
  {
    "id" : 153,
    "title" : "Slot title 138",
    "startDate" : "2019-09-04T18:44:02.000Z",
    "createdAt" : "2015-10-03T22:30:47.855Z",
    "updatedAt" : "2015-10-03T22:30:47.855Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 477,
      "username" : "User 436",
      "createdAt" : "2015-10-03T22:30:47.850Z",
      "updatedAt" : "2015-10-03T22:30:47.850Z",
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
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/153"
  },
  {
    "id" : 154,
    "title" : "Slot title 139",
    "startDate" : "2019-09-05T19:44:02.000Z",
    "createdAt" : "2015-10-03T22:30:47.882Z",
    "updatedAt" : "2015-10-03T22:30:47.882Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 480,
      "username" : "User 439",
      "createdAt" : "2015-10-03T22:30:47.878Z",
      "updatedAt" : "2015-10-03T22:30:47.878Z",
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
    "url" : "http://example.org/v1/slots/154"
  }
]
```
