# Me API

## Get my Calendar slots

### GET /v1/me/calendar

Returns array with all slots in users &#39;MyCalendar&#39;.
### Request

#### Headers

<pre>Authorization: Token token=o0I285-0Ouvtk2Tr9RgPpeqrEgY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendar</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/calendar&quot; -X GET \
	-H &quot;Authorization: Token token=o0I285-0Ouvtk2Tr9RgPpeqrEgY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2795dca5325b804fc8fe2cc4630f3d7c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3de70d25-ce3c-4d2b-94e5-225364377828
X-Runtime: 0.026985
Vary: Origin
Content-Length: 950</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 3,
    "title" : "Slot title 31",
    "startDate" : "2019-09-08T10:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:23.767Z",
    "updatedAt" : "2016-04-04T20:50:23.767Z",
    "deletedAt" : null,
    "endDate" : "2019-10-08T10:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 11,
      "username" : "User 173",
      "createdAt" : "2016-04-04T20:50:23.758Z",
      "updatedAt" : "2016-04-04T20:50:23.758Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 4,
    "title" : "Slot title 32",
    "startDate" : "2019-09-09T11:44:02.000Z",
    "createdAt" : "2016-04-04T20:50:23.792Z",
    "updatedAt" : "2016-04-04T20:50:23.792Z",
    "deletedAt" : null,
    "endDate" : "2019-10-09T11:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 14,
      "username" : "User 176",
      "createdAt" : "2016-04-04T20:50:23.782Z",
      "updatedAt" : "2016-04-04T20:50:23.782Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
