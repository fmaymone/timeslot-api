# Users API

## Get slots of unrelated user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39; and &#39;public&#39;-ReSlots

If a user is authenticated the slot settings (alerts) will be included.

### Parameters

Name : limit
Description : Query parameter to limit the amount of slots returned. Default is 50. We need a maximum for this.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (on the server).

Name : status
Description : Query parameter to filter slots relative to a point-in-time. Must be one of [past, ongoing, upcoming, now, around, all].
Default is &#39;all&#39;. Now = ongoing + upcoming. TODO: around = ongoing + [upcoming + past] (equally filled until limit).


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

<pre>Accept: application/json
Authorization: Token token=aLbCikewfJOE4Kq7Si3GxgQQGhE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/457/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/457/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=aLbCikewfJOE4Kq7Si3GxgQQGhE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;25b7f9bf8d2484ac844f2177eb60ff9e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 92332b18-09ed-4d6d-b181-78b6307d7f2f
X-Runtime: 0.077390
Vary: Origin
Content-Length: 1195</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 144,
    "title" : "Slot title 129",
    "startDate" : "2019-09-22T09:44:02.000Z",
    "createdAt" : "2015-09-20T18:49:46.100Z",
    "updatedAt" : "2015-09-20T18:49:46.100Z",
    "deletedAt" : null,
    "endDate" : "2019-10-22T09:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 460,
      "username" : "User 419",
      "createdAt" : "2015-09-20T18:49:46.092Z",
      "updatedAt" : "2015-09-20T18:49:46.092Z",
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
    "url" : "http://example.org/v1/slots/144"
  },
  {
    "id" : 146,
    "title" : "Slot title 131",
    "startDate" : "2019-09-24T11:44:02.000Z",
    "createdAt" : "2015-09-20T18:49:46.112Z",
    "updatedAt" : "2015-09-20T18:49:46.139Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 463,
      "username" : "User 422",
      "createdAt" : "2015-09-20T18:49:46.115Z",
      "updatedAt" : "2015-09-20T18:49:46.115Z",
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
    "slotter" : {
      "id" : 457
    },
    "parent" : {
      "id" : 147
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/146"
  }
]
```
