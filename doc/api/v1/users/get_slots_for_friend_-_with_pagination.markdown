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

<pre>Authorization: Token token=GnctjJ92mc2a7IrN7b8DljmtDlg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/149/slots?limit=3&amp;moment=2015-12-04T16%3A56%3A55.242Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-12-04T16:56:55.242Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/149/slots?limit=3&amp;moment=2015-12-04T16%3A56%3A55.242Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=GnctjJ92mc2a7IrN7b8DljmtDlg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e2d26610282be97f3aa04623f7ec6dbc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c791ada0-69ed-44a8-a3d8-70a2f9fc3240
X-Runtime: 0.039629
Vary: Origin
Content-Length: 1933</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2015-12-04T16:56:55.242Z",
    "before" : "NjQlMjAxNS0xMi0wNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMSAwODo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjMlMjAxNS0xMi0wNyAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMCAwNzo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 64,
      "title" : "Slot title 124",
      "startDate" : "2015-12-05T00:00:00.000Z",
      "createdAt" : "2015-12-04T16:56:55.162Z",
      "updatedAt" : "2015-12-04T16:56:55.162Z",
      "deletedAt" : null,
      "endDate" : "2019-10-21T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 154,
        "username" : "User 440",
        "createdAt" : "2015-12-04T16:56:55.157Z",
        "updatedAt" : "2015-12-04T16:56:55.157Z",
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
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/64"
    },
    {
      "id" : 62,
      "title" : "Slot title 122",
      "startDate" : "2015-12-07T00:00:00.000Z",
      "createdAt" : "2015-12-04T16:56:55.147Z",
      "updatedAt" : "2015-12-04T16:56:55.147Z",
      "deletedAt" : null,
      "endDate" : "2019-10-19T06:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 152,
        "username" : "User 438",
        "createdAt" : "2015-12-04T16:56:55.143Z",
        "updatedAt" : "2015-12-04T16:56:55.143Z",
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
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/62"
    },
    {
      "id" : 63,
      "title" : "Slot title 123",
      "startDate" : "2015-12-07T00:00:00.000Z",
      "createdAt" : "2015-12-04T16:56:55.154Z",
      "updatedAt" : "2015-12-04T16:56:55.154Z",
      "deletedAt" : null,
      "endDate" : "2019-10-20T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 153,
        "username" : "User 439",
        "createdAt" : "2015-12-04T16:56:55.149Z",
        "updatedAt" : "2015-12-04T16:56:55.149Z",
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
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/63"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=GnctjJ92mc2a7IrN7b8DljmtDlg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/149/slots</pre>

#### Query Parameters

<pre>after: NjMlMjAxNS0xMi0wNyAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMCAwNzo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/149/slots&quot; -X GET \
	-H &quot;Authorization: Token token=GnctjJ92mc2a7IrN7b8DljmtDlg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;0218795b4a6416442bf9505e2bad0d66&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 44eff15e-eb2a-4a8b-9861-28b86bf6515b
X-Runtime: 0.035839
Vary: Origin
Content-Length: 1351</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "NjYlMjAxOS0wOS0yMiAwOTo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0yMiAwOTo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 66,
      "title" : "Slot title 125",
      "startDate" : "2019-09-22T09:44:02.000Z",
      "createdAt" : "2015-12-04T16:56:55.182Z",
      "updatedAt" : "2015-12-04T16:56:55.182Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 155,
        "username" : "User 441",
        "createdAt" : "2015-12-04T16:56:55.164Z",
        "updatedAt" : "2015-12-04T16:56:55.164Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "reslotsCounter" : 1,
      "slotter" : {
        "id" : 149
      },
      "parent" : {
        "id" : 65
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/66"
    },
    {
      "id" : 68,
      "title" : "Slot title 127",
      "startDate" : "2019-09-24T11:44:02.000Z",
      "createdAt" : "2015-12-04T16:56:55.221Z",
      "updatedAt" : "2015-12-04T16:56:55.221Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T11:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 158,
        "username" : "User 444",
        "createdAt" : "2015-12-04T16:56:55.207Z",
        "updatedAt" : "2015-12-04T16:56:55.207Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "reslotsCounter" : 1,
      "slotter" : {
        "id" : 149
      },
      "parent" : {
        "id" : 67
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/68"
    }
  ]
}
```
