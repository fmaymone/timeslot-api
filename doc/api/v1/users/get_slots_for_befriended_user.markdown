# Users API

## Get slots for befriended user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39; or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=jhvze_rx66Er3hYBvCrcrSXQ0s4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/206/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/206/slots&quot; -X GET \
	-H &quot;Authorization: Token token=jhvze_rx66Er3hYBvCrcrSXQ0s4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;20a8b13d34e4b493aa2e54878057c17a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 556177a9-9160-4f95-b546-2b1b340520b0
X-Runtime: 0.079195
Vary: Origin
Content-Length: 2355</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 91,
    "title" : "Slot title 124",
    "startDate" : "2019-09-21T08:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.455Z",
    "updatedAt" : "2015-10-30T15:01:08.455Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 208,
      "username" : "User 427",
      "createdAt" : "2015-10-30T15:01:08.451Z",
      "updatedAt" : "2015-10-30T15:01:08.451Z",
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
    "url" : "http://example.org/v1/slots/91"
  },
  {
    "id" : 92,
    "title" : "Slot title 125",
    "startDate" : "2019-09-22T09:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.462Z",
    "updatedAt" : "2015-10-30T15:01:08.462Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 209,
      "username" : "User 428",
      "createdAt" : "2015-10-30T15:01:08.458Z",
      "updatedAt" : "2015-10-30T15:01:08.458Z",
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
    "url" : "http://example.org/v1/slots/92"
  },
  {
    "id" : 94,
    "title" : "Slot title 126",
    "startDate" : "2019-09-23T10:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.481Z",
    "updatedAt" : "2015-10-30T15:01:08.481Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 210,
      "username" : "User 429",
      "createdAt" : "2015-10-30T15:01:08.465Z",
      "updatedAt" : "2015-10-30T15:01:08.465Z",
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
      "id" : 206
    },
    "parent" : {
      "id" : 93
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/94"
  },
  {
    "id" : 95,
    "title" : "Slot title 128",
    "startDate" : "2019-09-25T12:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.507Z",
    "updatedAt" : "2015-10-30T15:01:08.507Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 214,
      "username" : "User 433",
      "createdAt" : "2015-10-30T15:01:08.496Z",
      "updatedAt" : "2015-10-30T15:01:08.496Z",
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
      "id" : 11
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/95"
  }
]
```
