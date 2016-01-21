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

<pre>Authorization: Token token=0mjA-FeRV6Xg9GXlqU_tPYPhuYA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/186/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/186/slots&quot; -X GET \
	-H &quot;Authorization: Token token=0mjA-FeRV6Xg9GXlqU_tPYPhuYA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;826174c44f3e29d0a1833424ea960d32&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 092b8a5f-3cfa-4ff5-a3d3-f693634ddf98
X-Runtime: 0.030578
Vary: Origin
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 88,
    "title" : "Slot title 151",
    "startDate" : "2019-09-21T11:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:44.024Z",
    "updatedAt" : "2016-01-21T23:11:44.024Z",
    "deletedAt" : null,
    "endDate" : "2019-10-21T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 190,
      "username" : "User 487",
      "createdAt" : "2016-01-21T23:11:44.020Z",
      "updatedAt" : "2016-01-21T23:11:44.020Z",
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
    "title" : "Slot title 152",
    "startDate" : "2019-09-22T12:44:02.000Z",
    "createdAt" : "2016-01-21T23:11:44.052Z",
    "updatedAt" : "2016-01-21T23:11:44.052Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T12:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 191,
      "username" : "User 488",
      "createdAt" : "2016-01-21T23:11:44.027Z",
      "updatedAt" : "2016-01-21T23:11:44.027Z",
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
      "id" : 186
    },
    "parent" : {
      "id" : 89
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null
  }
]
```
