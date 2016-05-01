# Me API

## Get my schedule

### GET /v1/me/schedule

endpoint supports slot pagination

Returns array with all slots in users schedule.

### Parameters

Name : limit
Description : Maximum number of slots returned. Default is 40. Maximum is 100.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (server time).

Name : filter
Description : Query parameter to reduce the set of valid slots which are taken into account for the db query. Must be one of:
- **between**: takes 2 additional parameters: *earliest* and *latest*. Will only return slots which overlap with the specified time interval. *Rule: startDate &lt; latest AND endDate &gt; earliest*. Default **mode** is &#39;now&#39;, default **moment** == &#39;earliest.&#39;
- **newer**: tba
Default is **none**.

Name : mode
Description : Query parameter to request slots relative to a given **moment**. Must be one of:
- **past**: *start* before *moment*
- **upcoming**: *start* after or equal *moment*
- **ongoing**: *start* before &amp; *end* after *moment*
- **finished**: *start* &amp; *end* before *moment*
- **now**: *ongoing* &amp; *upcoming* slots
- **around**: limit/2 slots with *start* before *moment* and limit/2 slots with *start* after *moment*. This might miss ongoing slots.
- **all**: no restriction
Default is **upcoming**.

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : earliest
Description : A point in time. No results before this moment will be returned. Only works with &#39;between&#39; filter.

Name : latest
Description : A point in time. No results after this moment will be returned. Only works with &#39;between&#39; filter.


### Response Fields

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : mode
Description : Types of slots which were requested.

Name : filter
Description : Type of filter which was applied to initial data.

Name : moment
Description : Point-in-time which was used for the query.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

### Request

#### Headers

<pre>Authorization: Token token=IDVjzCZIrOOEyAiIvp8DIvBAy9o
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/schedule</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/schedule&quot; -X GET \
	-H &quot;Authorization: Token token=IDVjzCZIrOOEyAiIvp8DIvBAy9o&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f8b39464cef4f7b689f7e9bafd9c3e16&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 53a622e0-0cca-43b7-bb1a-ebc6f6299493
X-Runtime: 0.022973
Content-Length: 978</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 3,
    "title" : "Slot title 91",
    "startDate" : "2019-09-14T22:44:02.000Z",
    "createdAt" : "2016-05-01T22:54:10.388Z",
    "updatedAt" : "2016-05-01T22:54:10.388Z",
    "deletedAt" : null,
    "endDate" : "2019-10-14T22:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 16,
      "username" : "User 326",
      "createdAt" : "2016-05-01T22:54:10.378Z",
      "updatedAt" : "2016-05-01T22:54:10.378Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "private",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0
  },
  {
    "id" : 4,
    "title" : "Slot title 92",
    "startDate" : "2019-09-15T23:44:02.000Z",
    "createdAt" : "2016-05-01T22:54:10.427Z",
    "updatedAt" : "2016-05-01T22:54:10.427Z",
    "deletedAt" : null,
    "endDate" : "2019-10-15T23:44:02.000Z",
    "location" : null,
    "creator" : {
      "id" : 19,
      "username" : "User 329",
      "createdAt" : "2016-05-01T22:54:10.421Z",
      "updatedAt" : "2016-05-01T22:54:10.421Z",
      "deletedAt" : null,
      "image" : ""
    },
    "notes" : [],
    "media" : [],
    "settings" : {
      "alerts" : "omitted"
    },
    "visibility" : "public",
    "likerIds" : [],
    "likes" : 0,
    "commentsCounter" : 0
  }
]
```
