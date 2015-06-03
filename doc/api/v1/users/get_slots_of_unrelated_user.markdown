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
Authorization: Token token=C1sVBYDHXUqCvm4h1RsXF7Dwg64
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/352/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/352/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=C1sVBYDHXUqCvm4h1RsXF7Dwg64&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;64b764c47667c771bc5d459ec2408982&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1381b0b9-ac3e-480f-bb34-e69b82577298
X-Runtime: 0.065747
Content-Length: 1332</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 87,
    "title" : "Slot title 76",
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.263Z",
    "updatedAt" : "2015-06-03T10:39:41.263Z",
    "deletedAt" : null,
    "endDate" : "2014-10-23T04:44:02.000Z",
    "location" : {
      "id" : 80,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 357,
      "username" : "User 350",
      "createdAt" : "2015-06-03T10:39:41.254Z",
      "updatedAt" : "2015-06-03T10:39:41.254Z",
      "deletedAt" : null,
      "image" : null
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
    "startDate" : "2014-09-28T13:31:02.000Z",
    "createdAt" : "2015-06-03T10:39:41.283Z",
    "updatedAt" : "2015-06-03T10:39:41.306Z",
    "deletedAt" : null,
    "endDate" : "2014-10-25T06:44:02.000Z",
    "location" : {
      "id" : 82,
      "name" : "Acapulco",
      "street" : "",
      "city" : "",
      "postcode" : "",
      "country" : "",
      "latitude" : null,
      "longitude" : null
    },
    "creator" : {
      "id" : 362,
      "username" : "User 355",
      "createdAt" : "2015-06-03T10:39:41.285Z",
      "updatedAt" : "2015-06-03T10:39:41.285Z",
      "deletedAt" : null,
      "image" : null
    },
    "notes" : [],
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "settings" : {
      "alerts" : "0000000000"
    },
    "slotter" : {
      "id" : 352
    },
    "likes" : 0,
    "commentsCounter" : 0,
    "shareUrl" : null,
    "url" : "http://example.org/v1/slots/89"
  }
]
```
