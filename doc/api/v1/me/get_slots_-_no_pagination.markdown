# Me API

## Get slots - no pagination

### GET /v1/me/slots

Returns an array which includes all StandardSlots &amp; ReSlots the current_user has created including the slot settings (alerts).

The slots are ordered by startdate, enddate, ID.

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

<pre>Authorization: Token token=D9ZSpPpgS-puRKy9aktxWt0y-4U
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots&quot; -X GET \
	-H &quot;Authorization: Token token=D9ZSpPpgS-puRKy9aktxWt0y-4U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c20d2a3962f66581da85ee6c750c3011&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7ae24212-76f1-45c0-b840-6958696b9eda
X-Runtime: 0.032284
Vary: Origin
Content-Length: 2127</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 15,
    "title" : "Slot title 32",
    "startDate" : "2019-09-09T11:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:48.823Z",
    "updatedAt" : "2015-12-04T16:56:48.823Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 112,
      "username" : "User 163",
      "createdAt" : "2015-12-04T16:56:48.819Z",
      "updatedAt" : "2015-12-04T16:56:48.819Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 16,
    "title" : "Slot title 33",
    "startDate" : "2019-09-10T12:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:48.830Z",
    "updatedAt" : "2015-12-04T16:56:48.830Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 113,
      "username" : "User 164",
      "createdAt" : "2015-12-04T16:56:48.826Z",
      "updatedAt" : "2015-12-04T16:56:48.826Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "friends",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 18,
    "title" : "Slot title 34",
    "startDate" : "2019-09-11T13:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:48.849Z",
    "updatedAt" : "2015-12-04T16:56:48.849Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 114,
      "username" : "User 165",
      "createdAt" : "2015-12-04T16:56:48.832Z",
      "updatedAt" : "2015-12-04T16:56:48.832Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 111
    },
    "parent" : {
      "id" : 17
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 20,
    "title" : "Slot title 36",
    "startDate" : "2019-09-13T15:44:02.000Z",
    "createdAt" : "2015-12-04T16:56:48.897Z",
    "updatedAt" : "2015-12-04T16:56:48.897Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T15:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 117,
      "username" : "User 168",
      "createdAt" : "2015-12-04T16:56:48.883Z",
      "updatedAt" : "2015-12-04T16:56:48.883Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 111
    },
    "parent" : {
      "id" : 19
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
