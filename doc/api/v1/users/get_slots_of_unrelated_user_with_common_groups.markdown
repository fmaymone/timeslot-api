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

<pre>Authorization: Token token=7gEONqo6MGnck8a8s0Rx_DgN6Jg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/457/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/457/slots&quot; -X GET \
	-H &quot;Authorization: Token token=7gEONqo6MGnck8a8s0Rx_DgN6Jg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dd120f1bb405e7e8f670f0956b1a5966&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ede920af-82fe-45b2-a982-b167c269c7e6
X-Runtime: 0.069559
Vary: Origin
Content-Length: 1758</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 145,
    "title" : "Slot title 130",
    "startDate" : "2019-09-23T10:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.972Z",
    "updatedAt" : "2015-10-04T20:11:46.972Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 460,
      "username" : "User 420",
      "createdAt" : "2015-10-04T20:11:46.968Z",
      "updatedAt" : "2015-10-04T20:11:46.968Z",
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
    "url" : "http://example.org/v1/slots/145"
  },
  {
    "id" : 147,
    "title" : "Slot title 132",
    "startDate" : "2019-09-25T12:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.986Z",
    "updatedAt" : "2015-10-04T20:11:47.011Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 463,
      "username" : "User 423",
      "createdAt" : "2015-10-04T20:11:46.989Z",
      "updatedAt" : "2015-10-04T20:11:46.989Z",
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
      "id" : 457
    },
    "parent" : {
      "id" : 148
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/147"
  },
  {
    "id" : 149,
    "title" : "Slot title 134",
    "startDate" : "2019-09-27T14:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:47.026Z",
    "updatedAt" : "2015-10-04T20:11:47.026Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 466,
      "username" : "User 426",
      "createdAt" : "2015-10-04T20:11:47.013Z",
      "updatedAt" : "2015-10-04T20:11:47.013Z",
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
    "url" : "http://example.org/v1/slots/149"
  }
]
```
