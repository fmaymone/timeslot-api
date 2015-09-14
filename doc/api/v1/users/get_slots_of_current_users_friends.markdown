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
Authorization: Token token=ugtsD8vJXlq9xcOdjBA81C-vW1Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/friendslots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/friendslots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ugtsD8vJXlq9xcOdjBA81C-vW1Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;05a3e43093f66c54fe5381fcfae6cefe&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 751feb4f-2107-4b07-bf59-22f942a06bc7
X-Runtime: 0.117647
Vary: Origin
Content-Length: 1744</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 144,
    "title" : "Slot title 131",
    "startDate" : "2019-09-24T11:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.753Z",
    "updatedAt" : "2015-09-14T10:33:06.775Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 455,
      "username" : "User 416",
      "createdAt" : "2015-09-14T10:33:06.727Z",
      "updatedAt" : "2015-09-14T10:33:06.727Z",
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
      "id" : 455
    },
    "parent" : {
      "id" : 145
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/144"
  },
  {
    "id" : 146,
    "title" : "Slot title 133",
    "startDate" : "2019-09-26T13:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.786Z",
    "updatedAt" : "2015-09-14T10:33:06.786Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 463,
      "username" : "User 424",
      "createdAt" : "2015-09-14T10:33:06.781Z",
      "updatedAt" : "2015-09-14T10:33:06.781Z",
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
    "url" : "http://example.org/v1/slots/146"
  },
  {
    "id" : 147,
    "title" : "Slot title 134",
    "startDate" : "2019-09-27T14:44:02.000Z",
    "createdAt" : "2015-09-14T10:33:06.878Z",
    "updatedAt" : "2015-09-14T10:33:06.878Z",
    "deletedAt" : null,
    "endDate" : "2019-10-27T14:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 466,
      "username" : "User 427",
      "createdAt" : "2015-09-14T10:33:06.873Z",
      "updatedAt" : "2015-09-14T10:33:06.873Z",
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
    "url" : "http://example.org/v1/slots/147"
  }
]
```
