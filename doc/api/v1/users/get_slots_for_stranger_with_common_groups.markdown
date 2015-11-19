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

<pre>Authorization: Token token=Sjn0aPtVyDH9_FdbWuLd1tlM8Tc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/188/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/188/slots&quot; -X GET \
	-H &quot;Authorization: Token token=Sjn0aPtVyDH9_FdbWuLd1tlM8Tc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b96c177b23444285311fd6c310723ffb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4a4dd10e-6a37-431b-b489-32c647874e26
X-Runtime: 0.066864
Vary: Origin
Content-Length: 1680</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 88,
    "title" : "Slot title 144",
    "startDate" : "2019-09-14T04:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.860Z",
    "updatedAt" : "2015-11-17T23:46:18.860Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 192,
      "username" : "User 468",
      "createdAt" : "2015-11-17T23:46:18.856Z",
      "updatedAt" : "2015-11-17T23:46:18.856Z",
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
    "url" : "http://example.org/v1/slots/88"
  },
  {
    "id" : 90,
    "title" : "Slot title 145",
    "startDate" : "2019-09-15T05:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.879Z",
    "updatedAt" : "2015-11-17T23:46:18.879Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 193,
      "username" : "User 469",
      "createdAt" : "2015-11-17T23:46:18.862Z",
      "updatedAt" : "2015-11-17T23:46:18.862Z",
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
      "id" : 188
    },
    "parent" : {
      "id" : 89
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/90"
  },
  {
    "id" : 91,
    "title" : "Slot title 147",
    "startDate" : "2019-09-17T07:44:02.000Z",
    "createdAt" : "2015-11-17T23:46:18.899Z",
    "updatedAt" : "2015-11-17T23:46:18.899Z",
    "deletedAt" : null,
    "endDate" : "2019-10-17T07:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 196,
      "username" : "User 472",
      "createdAt" : "2015-11-17T23:46:18.887Z",
      "updatedAt" : "2015-11-17T23:46:18.887Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "group" : {
      "id" : 18
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/91"
  }
]
```
