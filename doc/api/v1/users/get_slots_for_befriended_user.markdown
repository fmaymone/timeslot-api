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
Authorization: Token token=J-Q7QAZGVlFENiBQibQ0DPH_Mbg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/429/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/429/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=J-Q7QAZGVlFENiBQibQ0DPH_Mbg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cfb412c5f31afffd5828bf541fa17f7f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: acb74328-ce13-4785-8c35-6ae3ccabc322
X-Runtime: 0.115406
Vary: Origin
Content-Length: 2345</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 127,
    "title" : "Slot title 112",
    "startDate" : "2019-09-05T16:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:06.056Z",
    "updatedAt" : "2015-09-28T10:16:06.056Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 431,
      "username" : "User 392",
      "createdAt" : "2015-09-28T10:16:06.050Z",
      "updatedAt" : "2015-09-28T10:16:06.050Z",
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
    "url" : "http://example.org/v1/slots/127"
  },
  {
    "id" : 128,
    "title" : "Slot title 113",
    "startDate" : "2019-09-06T17:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:06.064Z",
    "updatedAt" : "2015-09-28T10:16:06.064Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 432,
      "username" : "User 393",
      "createdAt" : "2015-09-28T10:16:06.059Z",
      "updatedAt" : "2015-09-28T10:16:06.059Z",
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
    "url" : "http://example.org/v1/slots/128"
  },
  {
    "id" : 130,
    "title" : "Slot title 115",
    "startDate" : "2019-09-08T19:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:06.077Z",
    "updatedAt" : "2015-09-28T10:16:06.114Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 435,
      "username" : "User 396",
      "createdAt" : "2015-09-28T10:16:06.086Z",
      "updatedAt" : "2015-09-28T10:16:06.086Z",
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
      "id" : 131
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/130"
  },
  {
    "id" : 132,
    "title" : "Slot title 117",
    "startDate" : "2019-09-10T21:44:02.000Z",
    "createdAt" : "2015-09-28T10:16:06.212Z",
    "updatedAt" : "2015-09-28T10:16:06.212Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 439,
      "username" : "User 400",
      "createdAt" : "2015-09-28T10:16:06.199Z",
      "updatedAt" : "2015-09-28T10:16:06.199Z",
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
      "id" : 52
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/132"
  }
]
```
