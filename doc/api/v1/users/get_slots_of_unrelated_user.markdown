# Users API

## Get slots of unrelated user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39; and &#39;public&#39;-ReSlots

If a user is authenticated the slot settings (alerts) will be included.

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

Name : photos
Description : Photos for the slot

Name : voices
Description : Voice recordings for the slot

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
Authorization: Token token=UAuHC_pMASw8QkQe4taaFVPUIw4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/279/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/279/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=UAuHC_pMASw8QkQe4taaFVPUIw4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;06cac6214fdf0a0804b0a2c63e94113e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8b0ffe75-7f14-42e9-b620-ed9cbc817b38
X-Runtime: 0.068310
Content-Length: 1172</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 87,
    "title" : "Slot title 76",
    "startDate" : "2019-09-23T04:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.632Z",
    "updatedAt" : "2015-06-11T16:21:01.632Z",
    "deletedAt" : null,
    "endDate" : "2019-10-23T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 282,
      "username" : "User 275",
      "createdAt" : "2015-06-11T16:21:01.627Z",
      "updatedAt" : "2015-06-11T16:21:01.627Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/87"
  },
  {
    "id" : 89,
    "title" : "Slot title 78",
    "startDate" : "2019-09-25T06:44:02.000Z",
    "createdAt" : "2015-06-11T16:21:01.644Z",
    "updatedAt" : "2015-06-11T16:21:01.662Z",
    "deletedAt" : null,
    "endDate" : "2019-10-25T06:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 285,
      "username" : "User 278",
      "createdAt" : "2015-06-11T16:21:01.647Z",
      "updatedAt" : "2015-06-11T16:21:01.647Z",
      "deletedAt" : null,
      "image" : {
        "clyid" : null,
        "localId" : null
      }
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 279
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/89"
  }
]
```
