# Users API

## Get slots of unrelated user with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

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

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

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
Authorization: Token token=cwnwKtH1l0knWpWxqLONyle8tls
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/267/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/267/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=cwnwKtH1l0knWpWxqLONyle8tls&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a91c4edb442fe986c7016ca3d0407c07&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: efba5e90-b55d-4448-aed8-0b6b805e72c6
X-Runtime: 0.072627
Content-Length: 1787</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 80,
    "title" : "Slot title 69",
    "startDate" : "2019-09-16T21:44:02.000Z",
    "createdAt" : "2015-06-15T11:19:16.589Z",
    "updatedAt" : "2015-06-15T11:19:16.589Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T21:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 270,
      "username" : "User 264",
      "createdAt" : "2015-06-15T11:19:16.585Z",
      "updatedAt" : "2015-06-15T11:19:16.585Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/80"
  },
  {
    "id" : 82,
    "title" : "Slot title 71",
    "startDate" : "2019-09-18T23:44:02.000Z",
    "createdAt" : "2015-06-15T11:19:16.599Z",
    "updatedAt" : "2015-06-15T11:19:16.615Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 273,
      "username" : "User 267",
      "createdAt" : "2015-06-15T11:19:16.601Z",
      "updatedAt" : "2015-06-15T11:19:16.601Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 267
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/82"
  },
  {
    "id" : 84,
    "title" : "Slot title 73",
    "startDate" : "2019-09-20T01:44:02.000Z",
    "createdAt" : "2015-06-15T11:19:16.633Z",
    "updatedAt" : "2015-06-15T11:19:16.633Z",
    "deletedAt" : null,
    "endDate" : "2019-10-20T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 276,
      "username" : "User 270",
      "createdAt" : "2015-06-15T11:19:16.618Z",
      "updatedAt" : "2015-06-15T11:19:16.618Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "group" : {
      "id" : 48
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/84"
  }
]
```
