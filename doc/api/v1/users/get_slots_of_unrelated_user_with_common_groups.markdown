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

<pre>Authorization: Token token=8qtiJemNVgr2JB48ZeyBkHdHT7A
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/218/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/218/slots&quot; -X GET \
	-H &quot;Authorization: Token token=8qtiJemNVgr2JB48ZeyBkHdHT7A&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bd2f99989ede8c38242361398c55e181&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e55cd12a-8510-4db8-a305-80e059052135
X-Runtime: 0.069135
Vary: Origin
Content-Length: 1775</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 99,
    "title" : "Slot title 132",
    "startDate" : "2019-09-02T16:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.643Z",
    "updatedAt" : "2015-10-30T15:01:08.643Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T16:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 221,
      "username" : "User 439",
      "createdAt" : "2015-10-30T15:01:08.639Z",
      "updatedAt" : "2015-10-30T15:01:08.639Z",
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
    "url" : "http://example.org/v1/slots/99"
  },
  {
    "id" : 101,
    "title" : "Slot title 133",
    "startDate" : "2019-09-03T17:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.660Z",
    "updatedAt" : "2015-10-30T15:01:08.660Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T17:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 222,
      "username" : "User 440",
      "createdAt" : "2015-10-30T15:01:08.646Z",
      "updatedAt" : "2015-10-30T15:01:08.646Z",
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
      "id" : 218
    },
    "parent" : {
      "id" : 100
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/101"
  },
  {
    "id" : 102,
    "title" : "Slot title 135",
    "startDate" : "2019-09-05T19:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.676Z",
    "updatedAt" : "2015-10-30T15:01:08.676Z",
    "deletedAt" : null,
    "endDate" : "2019-10-05T19:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 225,
      "username" : "User 443",
      "createdAt" : "2015-10-30T15:01:08.665Z",
      "updatedAt" : "2015-10-30T15:01:08.665Z",
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
      "id" : 13
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/102"
  }
]
```
