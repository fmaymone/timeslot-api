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

<pre>Authorization: Token token=6AiEQdREuZ-OlxsXlMkRe0-lU-0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/279/slots?limit=3&amp;moment=2016-05-01T22%3A54%3A16.326Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-05-01T22:54:16.326Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/279/slots?limit=3&amp;moment=2016-05-01T22%3A54%3A16.326Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=6AiEQdREuZ-OlxsXlMkRe0-lU-0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e69299d977822ba1e1b5003a2619861f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ea89ca79-c80a-4edb-b07c-1f2aac1c6fa0
X-Runtime: 0.027895
Content-Length: 1912</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-05-01T22:54:16.326Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "ODclMjAxNi0wNS0wMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xMiAwNTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "ODklMjAxNi0wNS0wMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNCAwNzo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 87,
      "title" : "Slot title 170",
      "startDate" : "2016-05-02T00:00:00.000Z",
      "createdAt" : "2016-05-01T22:54:16.310Z",
      "updatedAt" : "2016-05-01T22:54:16.310Z",
      "deletedAt" : null,
      "endDate" : "2019-10-12T05:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 282,
        "username" : "User 612",
        "createdAt" : "2016-05-01T22:54:16.305Z",
        "updatedAt" : "2016-05-01T22:54:16.305Z",
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
      "url" : "http://example.org/v1/slots/87"
    },
    {
      "id" : 88,
      "title" : "Slot title 171",
      "startDate" : "2016-05-02T00:00:00.000Z",
      "createdAt" : "2016-05-01T22:54:16.317Z",
      "updatedAt" : "2016-05-01T22:54:16.317Z",
      "deletedAt" : null,
      "endDate" : "2019-10-13T06:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 283,
        "username" : "User 613",
        "createdAt" : "2016-05-01T22:54:16.312Z",
        "updatedAt" : "2016-05-01T22:54:16.312Z",
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
      "url" : "http://example.org/v1/slots/88"
    },
    {
      "id" : 89,
      "title" : "Slot title 172",
      "startDate" : "2016-05-02T00:00:00.000Z",
      "createdAt" : "2016-05-01T22:54:16.324Z",
      "updatedAt" : "2016-05-01T22:54:16.324Z",
      "deletedAt" : null,
      "endDate" : "2019-10-14T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 284,
        "username" : "User 614",
        "createdAt" : "2016-05-01T22:54:16.319Z",
        "updatedAt" : "2016-05-01T22:54:16.319Z",
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
      "url" : "http://example.org/v1/slots/89"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=6AiEQdREuZ-OlxsXlMkRe0-lU-0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/279/slots</pre>

#### Query Parameters

<pre>after: ODklMjAxNi0wNS0wMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNCAwNzo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/279/slots&quot; -X GET \
	-H &quot;Authorization: Token token=6AiEQdREuZ-OlxsXlMkRe0-lU-0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;63e09dc675781e6749785dee24ad7c04&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ba793a0d-b91e-47d5-a040-3547fddb5df8
X-Runtime: 0.013887
Content-Length: 133</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 100,
    "mode" : null,
    "moment" : null,
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "MCUl",
    "after" : null
  },
  "data" : []
}
```
