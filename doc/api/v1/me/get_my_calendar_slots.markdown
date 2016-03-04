# Me API

## Get my Calendar slots

### GET /v1/me/calendar

Returns array with all slots in users &#39;MyCalendar&#39;.
### Request

#### Headers

<pre>Authorization: Token token=V_NjiTZJNj4p1RxubIo_sUpWxtk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/calendar</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/calendar&quot; -X GET \
	-H &quot;Authorization: Token token=V_NjiTZJNj4p1RxubIo_sUpWxtk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a6633972a85a13da37aad92644c81dfd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 64ebae2c-3b33-454d-b314-483ed3c6b2f5
X-Runtime: 0.026229
Vary: Origin
Content-Length: 950</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 3,
    "title" : "Slot title 25",
    "startDate" : "2019-09-02T04:44:02.000Z",
    "createdAt" : "2016-03-03T13:47:57.406Z",
    "updatedAt" : "2016-03-03T13:47:57.406Z",
    "deletedAt" : null,
    "endDate" : "2019-10-02T04:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 11,
      "username" : "User 155",
      "createdAt" : "2016-03-03T13:47:57.399Z",
      "updatedAt" : "2016-03-03T13:47:57.399Z",
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
    "title" : "Slot title 26",
    "startDate" : "2019-09-03T05:44:02.000Z",
    "createdAt" : "2016-03-03T13:47:57.427Z",
    "updatedAt" : "2016-03-03T13:47:57.427Z",
    "deletedAt" : null,
    "endDate" : "2019-10-03T05:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 14,
      "username" : "User 158",
      "createdAt" : "2016-03-03T13:47:57.419Z",
      "updatedAt" : "2016-03-03T13:47:57.419Z",
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
