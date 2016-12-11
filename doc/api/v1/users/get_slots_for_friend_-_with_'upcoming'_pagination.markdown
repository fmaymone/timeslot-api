# Users API

## Get slots for Friend - with &#39;upcoming&#39; pagination

### GET /v1/users/:id/slots

Response contains &#39;*paging*&#39; hash &amp; &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **mode** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes StandardSlots.

If a user is authenticated the slot settings (alerts) will be included.

The returned slots are ordered by startdate, enddate, id.

### Parameters

Name : id
Description : ID of the user to get the slots for.

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
Default is **all**.

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

Name : moment
Description : Point-in-time which was used for the query.

Name : filter
Description : Type of filter which was applied to initial data.

Name : earliest
Description : If set, no Slots which have ended before this point-in-time will be included in the result.

Name : latest
Description : If set, no Slots which are starting after this point-in-time will be included in the result.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

### Request

#### Headers

<pre>Authorization: Token token=n9oeYTAvVyKgPAkm3-ZOJiWfQkM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/147/slots?limit=3&amp;moment=2016-12-11T19%3A54%3A41.624Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-12-11T19:54:41.624Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/147/slots?limit=3&amp;moment=2016-12-11T19%3A54%3A41.624Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=n9oeYTAvVyKgPAkm3-ZOJiWfQkM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f85a0ba5e5818cbeb1d345b311cea756&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6cfd731e-cffb-4397-b8cd-cea71d9ce9f1
X-Runtime: 0.050308
Content-Length: 2276</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-12-11T19:54:41.624Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "NTklMjAxNi0xMi0xMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wNyAwNjo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjElMjAxNi0xMi0xMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOSAwODo0NDowMi4wMDAwMDAwMDA=",
    "poolSize" : 3
  },
  "data" : [
    {
      "id" : 59,
      "title" : "Slot title 222",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:54:41.593Z",
      "updatedAt" : "2016-12-11T19:54:41.593Z",
      "deletedAt" : null,
      "endDate" : "2019-10-07T06:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 147,
        "username" : "User 883",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:41.559Z",
        "updatedAt" : "2016-12-11T19:54:41.559Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "friends",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/59"
    },
    {
      "id" : 60,
      "title" : "Slot title 223",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:54:41.610Z",
      "updatedAt" : "2016-12-11T19:54:41.610Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 147,
        "username" : "User 883",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:41.559Z",
        "updatedAt" : "2016-12-11T19:54:41.559Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "friends",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/60"
    },
    {
      "id" : 61,
      "title" : "Slot title 224",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:54:41.620Z",
      "updatedAt" : "2016-12-11T19:54:41.620Z",
      "deletedAt" : null,
      "endDate" : "2019-10-09T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 147,
        "username" : "User 883",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:54:41.559Z",
        "updatedAt" : "2016-12-11T19:54:41.559Z",
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
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/61"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=n9oeYTAvVyKgPAkm3-ZOJiWfQkM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/147/slots</pre>

#### Query Parameters

<pre>after: NjElMjAxNi0xMi0xMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOSAwODo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/147/slots&quot; -X GET \
	-H &quot;Authorization: Token token=n9oeYTAvVyKgPAkm3-ZOJiWfQkM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;51727c5d839db454f002c36837fd0822&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3c65b9a3-9a7f-4fba-841f-4e55adfb7965
X-Runtime: 0.021965
Content-Length: 225</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "mode" : null,
    "moment" : null,
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "NjElMjAxNi0xMi0xMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOSAwODo0NDowMi4wMDAwMDAwMDA=",
    "after" : null,
    "poolSize" : 3
  },
  "data" : []
}
```
