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
Authorization: Token token=6GIvlOp2sJkrWudtFPWt0K_y3CE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=6GIvlOp2sJkrWudtFPWt0K_y3CE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3afde5d6fe4dd5b49bb4faaf623c0cbe&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e3636b98-88d3-488a-aeff-dc4b721e6550
X-Runtime: 0.087203
Vary: Origin
Content-Length: 1801</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 115,
    "title" : "Slot title 152",
    "startDate" : "2019-09-22T12:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:44.340Z",
    "updatedAt" : "2015-11-17T12:12:44.340Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 243,
      "username" : "User 483",
      "createdAt" : "2015-11-17T12:12:44.317Z",
      "updatedAt" : "2015-11-17T12:12:44.317Z",
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
      "id" : 241
    },
    "parent" : {
      "id" : 114
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/115"
  },
  {
    "id" : 116,
    "title" : "Slot title 154",
    "startDate" : "2019-09-24T14:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:44.352Z",
    "updatedAt" : "2015-11-17T12:12:44.352Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 247,
      "username" : "User 487",
      "createdAt" : "2015-11-17T12:12:44.347Z",
      "updatedAt" : "2015-11-17T12:12:44.347Z",
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
    "url" : "http://example.org/v1/slots/116"
  },
  {
    "id" : 117,
    "title" : "Slot title 155",
    "startDate" : "2019-09-25T15:44:02.000Z",
    "createdAt" : "2015-11-17T12:12:44.373Z",
    "updatedAt" : "2015-11-17T12:12:44.373Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 250,
      "username" : "User 490",
      "createdAt" : "2015-11-17T12:12:44.369Z",
      "updatedAt" : "2015-11-17T12:12:44.369Z",
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
    "url" : "http://example.org/v1/slots/117"
  }
]
```
