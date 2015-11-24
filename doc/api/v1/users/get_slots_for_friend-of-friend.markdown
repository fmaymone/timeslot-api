# Users API

## Get slots for Friend-of-Friend

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;foaf&#39; (friend-of-friend) or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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

<pre>Authorization: Token token=z5L3_q5SSYgA30AJH6IY9l3lBC8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/174/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/174/slots&quot; -X GET \
	-H &quot;Authorization: Token token=z5L3_q5SSYgA30AJH6IY9l3lBC8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e68f8e784f40d41e54bd583a2acec6d0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cf02ad3c-e1d0-4095-a2f5-badfb14a24ad
X-Runtime: 0.044927
Vary: Origin
Content-Length: 2064</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 79,
    "title" : "Slot title 139",
    "startDate" : "2019-09-09T23:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:36.927Z",
    "updatedAt" : "2015-11-24T23:47:36.927Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 177,
      "username" : "User 459",
      "createdAt" : "2015-11-24T23:47:36.922Z",
      "updatedAt" : "2015-11-24T23:47:36.922Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "foaf",
    "reslotsCounter" : 0,
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 80,
    "title" : "Slot title 140",
    "startDate" : "2019-09-10T00:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:36.933Z",
    "updatedAt" : "2015-11-24T23:47:36.933Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 178,
      "username" : "User 460",
      "createdAt" : "2015-11-24T23:47:36.929Z",
      "updatedAt" : "2015-11-24T23:47:36.929Z",
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
    "id" : 82,
    "title" : "Slot title 141",
    "startDate" : "2019-09-11T01:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:36.952Z",
    "updatedAt" : "2015-11-24T23:47:36.952Z",
    "deletedAt" : null,
    "endDate" : "2019-10-11T01:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 179,
      "username" : "User 461",
      "createdAt" : "2015-11-24T23:47:36.936Z",
      "updatedAt" : "2015-11-24T23:47:36.936Z",
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
      "id" : 174
    },
    "parent" : {
      "id" : 81
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 83,
    "title" : "Slot title 143",
    "startDate" : "2019-09-13T03:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:37.014Z",
    "updatedAt" : "2015-11-24T23:47:37.014Z",
    "deletedAt" : null,
    "endDate" : "2019-10-13T03:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 184,
      "username" : "User 466",
      "createdAt" : "2015-11-24T23:47:37.003Z",
      "updatedAt" : "2015-11-24T23:47:37.003Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "group" : {
      "id" : 16
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
