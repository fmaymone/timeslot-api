# Users API

## Get slots for befriended user

### GET /v1/users/:id/slots

Returns an array which includes StandardSlots with visibility &#39;friend&#39; or &#39;public&#39;, ReSlots &amp; shared GroupSlots

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
Authorization: Token token=EWD3w5ASajNb5i3Bb_4EmGC7KRg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/232/slots</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/232/slots&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=EWD3w5ASajNb5i3Bb_4EmGC7KRg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;61149b1e02d748f9509e24bc8131801b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a9822ec0-1686-4471-825e-5f970770033f
X-Runtime: 0.074353
Content-Length: 1655</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>[
  {
    "id" : 67,
    "title" : "Slot title 59",
    "locationId" : null,
    "createdAt" : "2015-05-06T11:28:52.271Z",
    "updatedAt" : "2015-05-06T11:28:52.271Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-06T11:44:02.000Z",
    "visibility" : "friends",
    "settings" : {
      "alerts" : "0000000000"
    },
    "notes" : [],
    "likes" : 0,
    "commentsCounter" : 0,
    "photos" : [],
    "voices" : [],
    "videos" : [],
    "url" : "http://example.org/v1/slots/67",
    "creatorId" : 234
  },
  {
    "id" : 68,
    "title" : "Slot title 60",
    "locationId" : null,
    "createdAt" : "2015-05-06T11:28:52.276Z",
    "updatedAt" : "2015-05-06T11:28:52.276Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-07T12:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/68",
    "creatorId" : 235
  },
  {
    "id" : 70,
    "title" : "Slot title 62",
    "locationId" : null,
    "createdAt" : "2015-05-06T11:28:52.284Z",
    "updatedAt" : "2015-05-06T11:28:52.295Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-09T14:44:02.000Z",
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
    "url" : "http://example.org/v1/slots/70",
    "creatorId" : 238
  },
  {
    "id" : 72,
    "title" : "Slot title 64",
    "locationId" : null,
    "createdAt" : "2015-05-06T11:28:52.318Z",
    "updatedAt" : "2015-05-06T11:28:52.318Z",
    "deletedAt" : null,
    "startDate" : "2014-09-28T13:31:02.000Z",
    "endDate" : "2014-10-11T16:44:02.000Z",
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
    "groupId" : 46,
    "url" : "http://example.org/v1/slots/72",
    "creatorId" : 242
  }
]</pre>
