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
Authorization: Token token=-k_I-skcJ83HzE7xeqwf74h1u9Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/281/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/281/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-k_I-skcJ83HzE7xeqwf74h1u9Y&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;48cb36ff3459a603be7b8941dc7234a2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3c6a1277-aa56-437c-96b2-abb44181c6fc
X-Runtime: 0.051134
Content-Length: 1194</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 88,
    "title" : "Slot title 77",
    "startDate" : "2019-09-24T05:44:02.000Z",
    "createdAt" : "2015-06-15T11:19:16.775Z",
    "updatedAt" : "2015-06-15T11:19:16.775Z",
    "deletedAt" : null,
    "endDate" : "2019-10-24T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 284,
      "username" : "User 277",
      "createdAt" : "2015-06-15T11:19:16.770Z",
      "updatedAt" : "2015-06-15T11:19:16.770Z",
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
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/88"
  },
  {
    "id" : 90,
    "title" : "Slot title 79",
    "startDate" : "2019-09-26T07:44:02.000Z",
    "createdAt" : "2015-06-15T11:19:16.787Z",
    "updatedAt" : "2015-06-15T11:19:16.807Z",
    "deletedAt" : null,
    "endDate" : "2019-10-26T07:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 287,
      "username" : "User 280",
      "createdAt" : "2015-06-15T11:19:16.790Z",
      "updatedAt" : "2015-06-15T11:19:16.790Z",
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
    "media" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 281
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/90"
  }
]
```
