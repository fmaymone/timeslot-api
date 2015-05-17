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
Authorization: Token token=G6SNby4vQmlTu94JYZDlmQhweDM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/260/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/260/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=G6SNby4vQmlTu94JYZDlmQhweDM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;0d565dbe416439f18b0dce9ce1ed5b76&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6af0d75d-35bc-48ec-8018-fc884ef61dc7
X-Runtime: 0.066505
Content-Length: 821</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 84,
    "title" : "Slot title 76",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:40.608Z",
    "updatedAt" : "2015-05-06T21:29:40.608Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-23T04:44:02.000Z",
    "visibility" : "public",
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/84",
    "creatorId" : 263
  },
  {
    "id" : 86,
    "title" : "Slot title 78",
    "locationId" : null,
    "createdAt" : "2015-05-06T21:29:40.619Z",
    "updatedAt" : "2015-05-06T21:29:40.631Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-25T06:44:02.000Z",
    "visibility" : null,
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/86",
    "creatorId" : 266
  }
]
```
