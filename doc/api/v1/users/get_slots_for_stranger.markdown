# Users API

## Get slots for Stranger

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39; and &#39;public&#39;-ReSlots

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

<pre>Authorization: Token token=iA5bKnMcQFNGbMsETp0XED5hwt4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/202/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/202/slots&quot; -X GET \
	-H &quot;Authorization: Token token=iA5bKnMcQFNGbMsETp0XED5hwt4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8f070c787e3f825ab344ff622a9742bd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a8e4bc94-9db6-4990-9dd6-5a8ebbee6417
X-Runtime: 0.051910
Vary: Origin
Content-Length: 1033</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 92,
    "title" : "Slot title 175",
    "startDate" : "2019-09-18T11:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.585Z",
    "updatedAt" : "2016-01-29T19:39:19.585Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 206,
      "username" : "User 536",
      "createdAt" : "2016-01-29T19:39:19.572Z",
      "updatedAt" : "2016-01-29T19:39:19.572Z",
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
    "commentsCounter" : 0
  },
  {
    "id" : 94,
    "title" : "Slot title 176",
    "startDate" : "2019-09-19T12:44:02.000Z",
    "createdAt" : "2016-01-29T19:39:19.627Z",
    "updatedAt" : "2016-01-29T19:39:19.627Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 207,
      "username" : "User 537",
      "createdAt" : "2016-01-29T19:39:19.591Z",
      "updatedAt" : "2016-01-29T19:39:19.591Z",
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
      "id" : 202
    },
    "parent" : {
      "id" : 93
    },
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
