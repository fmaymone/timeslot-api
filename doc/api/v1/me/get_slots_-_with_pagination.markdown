# Me API

## Get slots - with pagination

### GET /v1/me/slots

Response contains &#39;*paging*&#39; hash &amp; &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **filter** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes StandardSlots &amp; ReSlots the current_user has made including the slot settings (alerts).

The slots are ordered by startdate, enddate, id.

### Parameters

Name : limit
Description : Maximum number of slots returned. Default is 40. Maximum is 100.

Name : moment
Description : A point in time. Query parameter to get slots relative to a specific moment. Must be UTC.
Default is Time.zone.now (server time).

Name : filter
Description : Query parameter to filter slots relative to a given **moment**. Must be one of:
- **past**: *start* before *moment*
- **upcoming**: *start* after or equal *moment*
- **ongoing**: *start* before &amp; *end* after *moment*
- **finished**: *start* &amp; *end* before *moment*
- **now**: *ongoing* &amp; *upcoming* slots
- **around**: tba
- **all**: no restriction
Default is **upcoming**.

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **status** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **filter** and **moment** are ignored.


### Response Fields

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : filter
Description : Types of slots which were requested.

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

<pre>Authorization: Token token=xp1XwCLCE8r--NE4YTLhf85R1Tc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2016-01-29T19%3A39%3A00.536Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-01-29T19:39:00.536Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots?limit=3&amp;moment=2016-01-29T19%3A39%3A00.536Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=xp1XwCLCE8r--NE4YTLhf85R1Tc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;843940b8b3b3e089301a427ba4821d0c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 16b9f642-ba13-4b4b-9fb1-7e72ffeeb5be
X-Runtime: 0.174758
Vary: Origin
Content-Length: 1876</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2016-01-29T19:39:00.536Z",
    "before" : "MTElMjAxNi0wMS0zMCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNSAxNzo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NiUyMDE2LTAyLTAxIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTEwIDEyOjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 11,
      "title" : "Slot title 38",
      "startDate" : "2016-01-30T00:00:00.000Z",
      "createdAt" : "2016-01-29T19:39:00.527Z",
      "updatedAt" : "2016-01-29T19:39:00.527Z",
      "deletedAt" : null,
      "endDate" : "2019-10-15T17:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 97,
        "username" : "User 175",
        "createdAt" : "2016-01-29T19:39:00.482Z",
        "updatedAt" : "2016-01-29T19:39:00.482Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "private",
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/11"
    },
    {
      "id" : 5,
      "title" : "Slot title 32",
      "startDate" : "2016-02-01T00:00:00.000Z",
      "createdAt" : "2016-01-29T19:39:00.016Z",
      "updatedAt" : "2016-01-29T19:39:00.016Z",
      "deletedAt" : null,
      "endDate" : "2019-10-09T11:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 89,
        "username" : "User 167",
        "createdAt" : "2016-01-29T19:38:59.991Z",
        "updatedAt" : "2016-01-29T19:38:59.991Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "private",
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/5"
    },
    {
      "id" : 6,
      "title" : "Slot title 33",
      "startDate" : "2016-02-01T00:00:00.000Z",
      "createdAt" : "2016-01-29T19:39:00.056Z",
      "updatedAt" : "2016-01-29T19:39:00.056Z",
      "deletedAt" : null,
      "endDate" : "2019-10-10T12:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 90,
        "username" : "User 168",
        "createdAt" : "2016-01-29T19:39:00.032Z",
        "updatedAt" : "2016-01-29T19:39:00.032Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "friends",
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/6"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=xp1XwCLCE8r--NE4YTLhf85R1Tc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/88/slots</pre>

#### Query Parameters

<pre>after: NiUyMDE2LTAyLTAxIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTEwIDEyOjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/88/slots&quot; -X GET \
	-H &quot;Authorization: Token token=xp1XwCLCE8r--NE4YTLhf85R1Tc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2c576a3ade5406ef0c4a35e00c6699a9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 336a0e6c-d396-4fa1-a2d1-12fb6745cbfe
X-Runtime: 0.050506
Vary: Origin
Content-Length: 1309</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "OCUyMDE5LTA5LTExIDEzOjQ0OjAyLjAwMDAwMDAwMCUyMDE5LTEwLTExIDEzOjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : null
  },
  "data" : [
    {
      "id" : 8,
      "title" : "Slot title 34",
      "startDate" : "2019-09-11T13:44:02.000Z",
      "createdAt" : "2016-01-29T19:39:00.138Z",
      "updatedAt" : "2016-01-29T19:39:00.138Z",
      "deletedAt" : null,
      "endDate" : "2019-10-11T13:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 91,
        "username" : "User 169",
        "createdAt" : "2016-01-29T19:39:00.067Z",
        "updatedAt" : "2016-01-29T19:39:00.067Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "reslotsCounter" : 1,
      "slotter" : {
        "id" : 88
      },
      "parent" : {
        "id" : 7
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/8"
    },
    {
      "id" : 10,
      "title" : "Slot title 36",
      "startDate" : "2019-09-13T15:44:02.000Z",
      "createdAt" : "2016-01-29T19:39:00.355Z",
      "updatedAt" : "2016-01-29T19:39:00.355Z",
      "deletedAt" : null,
      "endDate" : "2019-10-13T15:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 94,
        "username" : "User 172",
        "createdAt" : "2016-01-29T19:39:00.276Z",
        "updatedAt" : "2016-01-29T19:39:00.276Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "reslotsCounter" : 1,
      "slotter" : {
        "id" : 88
      },
      "parent" : {
        "id" : 9
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/10"
    }
  ]
}
```
