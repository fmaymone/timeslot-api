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

<pre>Authorization: Token token=rPVH5U9SJFFReq9bogsDQOW3vNo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/201/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/201/slots&quot; -X GET \
	-H &quot;Authorization: Token token=rPVH5U9SJFFReq9bogsDQOW3vNo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ffbe1d06468397f80346f4989291f1b7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e15afebf-2649-4faa-9647-2e27cfad6d54
X-Runtime: 0.049892
Vary: Origin
Content-Length: 1149</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 96,
    "title" : "Slot title 152",
    "startDate" : "2019-09-22T12:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:19.039Z",
    "updatedAt" : "2015-11-17T23:46:19.039Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 205,
      "username" : "User 480",
      "createdAt" : "2015-11-17T23:46:19.035Z",
      "updatedAt" : "2015-11-17T23:46:19.035Z",
      "deletedAt" : null,
      "image" : ""
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
    "url" : "http://example.org/v1/slots/96"
  },
  {
    "id" : 98,
    "title" : "Slot title 153",
    "startDate" : "2019-09-23T13:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:19.056Z",
    "updatedAt" : "2015-11-17T23:46:19.056Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T13:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 206,
      "username" : "User 481",
      "createdAt" : "2015-11-17T23:46:19.042Z",
      "updatedAt" : "2015-11-17T23:46:19.042Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "reslotsCounter" : 1,
    "slotter" : {
      "id" : 201
    },
    "parent" : {
      "id" : 97
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/98"
  }
]
```
