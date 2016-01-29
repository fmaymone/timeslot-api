# Users API

## Get slots for Friend - with pagination

### GET /v1/users/:id/slots

Response contains &#39;*paging*&#39; hash &amp; &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **filter** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes StandardSlots &amp; ReSlots

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

<pre>Authorization: Token token=xgI0SSbbNkzLJU9ThZt_B9_Tc_M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/162/slots?limit=3&amp;moment=2016-01-29T19%3A39%3A18.805Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-01-29T19:39:18.805Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/162/slots?limit=3&amp;moment=2016-01-29T19%3A39%3A18.805Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=xgI0SSbbNkzLJU9ThZt_B9_Tc_M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;429d3c1673206740afeb99a955e28d94&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b60b92c8-4e53-4d59-b12f-bb47877cbb7d
X-Runtime: 0.044232
Vary: Origin
Content-Length: 1885</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2016-01-29T19:39:18.805Z",
    "before" : "NjYlMjAxNi0wMS0zMCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xOSAwOTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjUlMjAxNi0wMi0wMSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xOCAwODo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 66,
      "title" : "Slot title 149",
      "startDate" : "2016-01-30T00:00:00.000Z",
      "createdAt" : "2016-01-29T19:39:18.664Z",
      "updatedAt" : "2016-01-29T19:39:18.664Z",
      "deletedAt" : null,
      "endDate" : "2019-10-19T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 167,
        "username" : "User 501",
        "createdAt" : "2016-01-29T19:39:18.657Z",
        "updatedAt" : "2016-01-29T19:39:18.657Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "reslotsCounter" : 0,
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/66"
    },
    {
      "id" : 64,
      "title" : "Slot title 147",
      "startDate" : "2016-02-01T00:00:00.000Z",
      "createdAt" : "2016-01-29T19:39:18.641Z",
      "updatedAt" : "2016-01-29T19:39:18.641Z",
      "deletedAt" : null,
      "endDate" : "2019-10-17T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 165,
        "username" : "User 499",
        "createdAt" : "2016-01-29T19:39:18.634Z",
        "updatedAt" : "2016-01-29T19:39:18.634Z",
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
      "url" : "http://example.org/v1/slots/64"
    },
    {
      "id" : 65,
      "title" : "Slot title 148",
      "startDate" : "2016-02-01T00:00:00.000Z",
      "createdAt" : "2016-01-29T19:39:18.653Z",
      "updatedAt" : "2016-01-29T19:39:18.653Z",
      "deletedAt" : null,
      "endDate" : "2019-10-18T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 166,
        "username" : "User 500",
        "createdAt" : "2016-01-29T19:39:18.646Z",
        "updatedAt" : "2016-01-29T19:39:18.646Z",
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
      "url" : "http://example.org/v1/slots/65"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=xgI0SSbbNkzLJU9ThZt_B9_Tc_M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/162/slots</pre>

#### Query Parameters

<pre>after: NjUlMjAxNi0wMi0wMSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xOCAwODo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/162/slots&quot; -X GET \
	-H &quot;Authorization: Token token=xgI0SSbbNkzLJU9ThZt_B9_Tc_M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;719a6d11404e861d8d1b09621ca95962&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ccd736b2-5ae1-41bf-89ea-d87d3d36b0c7
X-Runtime: 0.035996
Vary: Origin
Content-Length: 1319</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "NjglMjAxOS0wOS0yMCAxMDo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0yMCAxMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 68,
      "title" : "Slot title 150",
      "startDate" : "2019-09-20T10:44:02.000Z",
      "createdAt" : "2016-01-29T19:39:18.690Z",
      "updatedAt" : "2016-01-29T19:39:18.690Z",
      "deletedAt" : null,
      "endDate" : "2019-10-20T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 168,
        "username" : "User 502",
        "createdAt" : "2016-01-29T19:39:18.667Z",
        "updatedAt" : "2016-01-29T19:39:18.667Z",
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
        "id" : 162
      },
      "parent" : {
        "id" : 67
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/68"
    },
    {
      "id" : 70,
      "title" : "Slot title 152",
      "startDate" : "2019-09-22T12:44:02.000Z",
      "createdAt" : "2016-01-29T19:39:18.755Z",
      "updatedAt" : "2016-01-29T19:39:18.755Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T12:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 171,
        "username" : "User 505",
        "createdAt" : "2016-01-29T19:39:18.731Z",
        "updatedAt" : "2016-01-29T19:39:18.731Z",
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
        "id" : 162
      },
      "parent" : {
        "id" : 69
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/70"
    }
  ]
}
```
