# Users API

## Get slots of unrelated user with common groups

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;public&#39;, &#39;public&#39;-ReSlots &amp; shared GroupSlots

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
Authorization: Token token=NdYZqfU78GddfWoOGM8d_djMMlk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/259/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/259/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=NdYZqfU78GddfWoOGM8d_djMMlk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;96aff3752ea9ef33bd75a830b522a8ca&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5be45b67-6146-4d6a-9697-91d68e3ba8b1
X-Runtime: 0.063002
Content-Length: 1242</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 76,
    "title" : "Slot title 68",
    "locationId" : null,
    "createdAt" : "2015-05-19T10:51:52.685Z",
    "updatedAt" : "2015-05-19T10:51:52.685Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-15T20:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/76",
    "creatorId" : 262
  },
  {
    "id" : 78,
    "title" : "Slot title 70",
    "locationId" : null,
    "createdAt" : "2015-05-19T10:51:52.695Z",
    "updatedAt" : "2015-05-19T10:51:52.712Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-17T22:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/78",
    "creatorId" : 265
  },
  {
    "id" : 80,
    "title" : "Slot title 72",
    "locationId" : null,
    "createdAt" : "2015-05-19T10:51:52.725Z",
    "updatedAt" : "2015-05-19T10:51:52.725Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-19T00:44:02.000Z",
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
    "groupId" : 48,
    "url" : "http://example.org/v1/slots/80",
    "creatorId" : 268
  }
]
```
