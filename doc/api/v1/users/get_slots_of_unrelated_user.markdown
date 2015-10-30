# Users API

## Get slots of unrelated user

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

<pre>Authorization: Token token=5wQf9mDi_xWbDNS1gNef6HuD88Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/230/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/230/slots&quot; -X GET \
	-H &quot;Authorization: Token token=5wQf9mDi_xWbDNS1gNef6HuD88Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e686a33fe7162a22c8e76a956acce850&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 15bbc4e0-8aab-472b-96f6-9d9460218795
X-Runtime: 0.052298
Vary: Origin
Content-Length: 1214</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 106,
    "title" : "Slot title 139",
    "startDate" : "2019-09-09T23:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.814Z",
    "updatedAt" : "2015-10-30T15:01:08.814Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 233,
      "username" : "User 450",
      "createdAt" : "2015-10-30T15:01:08.810Z",
      "updatedAt" : "2015-10-30T15:01:08.810Z",
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
    "url" : "http://example.org/v1/slots/106"
  },
  {
    "id" : 108,
    "title" : "Slot title 140",
    "startDate" : "2019-09-10T00:44:02.000Z",
    "createdAt" : "2015-10-30T15:01:08.832Z",
    "updatedAt" : "2015-10-30T15:01:08.832Z",
    "deletedAt" : null,
    "endDate" : "2019-10-10T00:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 234,
      "username" : "User 451",
      "createdAt" : "2015-10-30T15:01:08.816Z",
      "updatedAt" : "2015-10-30T15:01:08.816Z",
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
      "id" : 230
    },
    "parent" : {
      "id" : 107
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/108"
  }
]
```
