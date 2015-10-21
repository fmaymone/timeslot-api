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

<pre>Authorization: Token token=_Yw5qeM1UJ4oa-SkrjJ8lYVBlp4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/443/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/443/slots&quot; -X GET \
	-H &quot;Authorization: Token token=_Yw5qeM1UJ4oa-SkrjJ8lYVBlp4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0d685aa6e1093bdd763bc2eba971f190&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 998faef3-e116-4ff3-8b18-003250058823
X-Runtime: 0.085574
Vary: Origin
Content-Length: 2345</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 136,
    "title" : "Slot title 121",
    "startDate" : "2019-09-14T01:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.751Z",
    "updatedAt" : "2015-10-04T20:11:46.751Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 445,
      "username" : "User 406",
      "createdAt" : "2015-10-04T20:11:46.747Z",
      "updatedAt" : "2015-10-04T20:11:46.747Z",
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
    "url" : "http://example.org/v1/slots/136"
  },
  {
    "id" : 137,
    "title" : "Slot title 122",
    "startDate" : "2019-09-15T02:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.758Z",
    "updatedAt" : "2015-10-04T20:11:46.758Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T02:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 446,
      "username" : "User 407",
      "createdAt" : "2015-10-04T20:11:46.754Z",
      "updatedAt" : "2015-10-04T20:11:46.754Z",
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
    "url" : "http://example.org/v1/slots/137"
  },
  {
    "id" : 139,
    "title" : "Slot title 124",
    "startDate" : "2019-09-17T04:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.772Z",
    "updatedAt" : "2015-10-04T20:11:46.794Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 449,
      "username" : "User 410",
      "createdAt" : "2015-10-04T20:11:46.775Z",
      "updatedAt" : "2015-10-04T20:11:46.775Z",
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
      "id" : 443
    },
    "parent" : {
      "id" : 140
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/139"
  },
  {
    "id" : 141,
    "title" : "Slot title 126",
    "startDate" : "2019-09-19T06:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:46.824Z",
    "updatedAt" : "2015-10-04T20:11:46.824Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 453,
      "username" : "User 414",
      "createdAt" : "2015-10-04T20:11:46.811Z",
      "updatedAt" : "2015-10-04T20:11:46.811Z",
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
    "url" : "http://example.org/v1/slots/141"
  }
]
```
