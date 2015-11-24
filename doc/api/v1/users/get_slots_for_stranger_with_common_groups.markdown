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

<pre>Authorization: Token token=H6lcdF_O-rIfsefRjK19rkKktS0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/188/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/188/slots&quot; -X GET \
	-H &quot;Authorization: Token token=H6lcdF_O-rIfsefRjK19rkKktS0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6b4ceffa2921b2b1e382fa8462acd4c2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4760902e-2ba6-4aec-8956-d6df65952635
X-Runtime: 0.041393
Vary: Origin
Content-Length: 1554</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 88,
    "title" : "Slot title 148",
    "startDate" : "2019-09-18T08:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:37.125Z",
    "updatedAt" : "2015-11-24T23:47:37.125Z",
    "deletedAt" : null,
    "endDate" : "2019-10-18T08:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 192,
      "username" : "User 473",
      "createdAt" : "2015-11-24T23:47:37.121Z",
      "updatedAt" : "2015-11-24T23:47:37.121Z",
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
    "id" : 90,
    "title" : "Slot title 149",
    "startDate" : "2019-09-19T09:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:37.147Z",
    "updatedAt" : "2015-11-24T23:47:37.147Z",
    "deletedAt" : null,
    "endDate" : "2019-10-19T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 193,
      "username" : "User 474",
      "createdAt" : "2015-11-24T23:47:37.127Z",
      "updatedAt" : "2015-11-24T23:47:37.127Z",
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
      "id" : 188
    },
    "parent" : {
      "id" : 89
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  },
  {
    "id" : 91,
    "title" : "Slot title 151",
    "startDate" : "2019-09-21T11:44:02.000Z",
    "createdAt" : "2015-11-24T23:47:37.188Z",
    "updatedAt" : "2015-11-24T23:47:37.188Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 196,
      "username" : "User 477",
      "createdAt" : "2015-11-24T23:47:37.177Z",
      "updatedAt" : "2015-11-24T23:47:37.177Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "group" : {
      "id" : 18
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
