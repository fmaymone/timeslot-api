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

<pre>Authorization: Token token=3YrJikoajCsGpFxuxlGjgJ3EoAs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/471/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/471/slots&quot; -X GET \
	-H &quot;Authorization: Token token=3YrJikoajCsGpFxuxlGjgJ3EoAs&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;627ffa705e47972c4d13fd19f5057940&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4edf6766-1af9-4ee0-bb1f-49426a5f26d1
X-Runtime: 0.051852
Vary: Origin
Content-Length: 1195</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 153,
    "title" : "Slot title 138",
    "startDate" : "2019-09-04T18:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:47.177Z",
    "updatedAt" : "2015-10-04T20:11:47.177Z",
    "deletedAt" : null,
    "endDate" : "2019-10-04T18:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 474,
      "username" : "User 433",
      "createdAt" : "2015-10-04T20:11:47.172Z",
      "updatedAt" : "2015-10-04T20:11:47.172Z",
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
    "url" : "http://example.org/v1/slots/153"
  },
  {
    "id" : 155,
    "title" : "Slot title 140",
    "startDate" : "2019-09-06T20:44:02.000Z",
    "createdAt" : "2015-10-04T20:11:47.191Z",
    "updatedAt" : "2015-10-04T20:11:47.214Z",
    "deletedAt" : null,
    "endDate" : "2019-10-06T20:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 477,
      "username" : "User 436",
      "createdAt" : "2015-10-04T20:11:47.194Z",
      "updatedAt" : "2015-10-04T20:11:47.194Z",
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
      "id" : 471
    },
    "parent" : {
      "id" : 156
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/155"
  }
]
```
