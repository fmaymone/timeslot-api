# Users API

## Get slots for Stranger with common groups

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

<pre>Authorization: Token token=CXPiKTwsdVqmzqTzXHENF0QWZto
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/177/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/177/slots&quot; -X GET \
	-H &quot;Authorization: Token token=CXPiKTwsdVqmzqTzXHENF0QWZto&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5bce8688af73a9e72d046b3dc73f0c2e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d1f8fecb-e944-4a6b-99f6-82a7a3a57150
X-Runtime: 0.030682
Vary: Origin
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 82,
    "title" : "Slot title 145",
    "startDate" : "2019-09-15T05:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.887Z",
    "updatedAt" : "2016-01-21T23:11:43.887Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 181,
      "username" : "User 479",
      "createdAt" : "2016-01-21T23:11:43.883Z",
      "updatedAt" : "2016-01-21T23:11:43.883Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 84,
    "title" : "Slot title 146",
    "startDate" : "2019-09-16T06:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:43.906Z",
    "updatedAt" : "2016-01-21T23:11:43.906Z",
    "deletedAt" : null,
    "endDate" : "2019-10-16T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 182,
      "username" : "User 480",
      "createdAt" : "2016-01-21T23:11:43.890Z",
      "updatedAt" : "2016-01-21T23:11:43.890Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 177
    },
    "parent" : {
      "id" : 83
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
