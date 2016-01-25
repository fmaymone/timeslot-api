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

<pre>Authorization: Token token=JRHxnvU6YoMRXjmPpMon5vJ7YZQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2015-12-23T11%3A18%3A31.688Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-12-23T11:18:31.688Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots?limit=3&amp;moment=2015-12-23T11%3A18%3A31.688Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=JRHxnvU6YoMRXjmPpMon5vJ7YZQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cffa16fb7c595ff63ba73d1bf660e9e1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1b6f4454-16e5-46c6-8e4a-b2f89bb358af
X-Runtime: 0.038936
Vary: Origin
Content-Length: 1925</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2015-12-23T11:18:31.688Z",
    "before" : "MTElMjAxNS0xMi0yNCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOSAxMTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NiUyMDE1LTEyLTI4IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTA0IDA2OjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 11,
      "title" : "Slot title 32",
      "startDate" : "2015-12-24T00:00:00.000Z",
      "createdAt" : "2015-12-23T11:18:31.686Z",
      "updatedAt" : "2015-12-23T11:18:31.686Z",
      "deletedAt" : null,
      "endDate" : "2019-10-09T11:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 100,
        "username" : "User 166",
        "createdAt" : "2015-12-23T11:18:31.682Z",
        "updatedAt" : "2015-12-23T11:18:31.682Z",
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
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/11"
    },
    {
      "id" : 5,
      "title" : "Slot title 26",
      "startDate" : "2015-12-28T00:00:00.000Z",
      "createdAt" : "2015-12-23T11:18:31.586Z",
      "updatedAt" : "2015-12-23T11:18:31.586Z",
      "deletedAt" : null,
      "endDate" : "2019-10-03T05:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 92,
        "username" : "User 158",
        "createdAt" : "2015-12-23T11:18:31.582Z",
        "updatedAt" : "2015-12-23T11:18:31.582Z",
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
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/5"
    },
    {
      "id" : 6,
      "title" : "Slot title 27",
      "startDate" : "2015-12-28T00:00:00.000Z",
      "createdAt" : "2015-12-23T11:18:31.593Z",
      "updatedAt" : "2015-12-23T11:18:31.593Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T06:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 93,
        "username" : "User 159",
        "createdAt" : "2015-12-23T11:18:31.589Z",
        "updatedAt" : "2015-12-23T11:18:31.589Z",
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
      "url" : "http://example.org/v1/slots/6"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=JRHxnvU6YoMRXjmPpMon5vJ7YZQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/91/slots</pre>

#### Query Parameters

<pre>after: NiUyMDE1LTEyLTI4IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTA0IDA2OjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/91/slots&quot; -X GET \
	-H &quot;Authorization: Token token=JRHxnvU6YoMRXjmPpMon5vJ7YZQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;95524c081dad918a92668a8a17d335c7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 315ebf2c-7927-4912-afb5-d2226e48327c
X-Runtime: 0.041872
Vary: Origin
Content-Length: 1341</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "OCUyMDE5LTA5LTA1IDA3OjQ0OjAyLjAwMDAwMDAwMCUyMDE5LTEwLTA1IDA3OjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : null
  },
  "data" : [
    {
      "id" : 8,
      "title" : "Slot title 28",
      "startDate" : "2019-09-05T07:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:31.611Z",
      "updatedAt" : "2015-12-23T11:18:31.611Z",
      "deletedAt" : null,
      "endDate" : "2019-10-05T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 94,
        "username" : "User 160",
        "createdAt" : "2015-12-23T11:18:31.596Z",
        "updatedAt" : "2015-12-23T11:18:31.596Z",
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
        "id" : 91
      },
      "parent" : {
        "id" : 7
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/8"
    },
    {
      "id" : 10,
      "title" : "Slot title 30",
      "startDate" : "2019-09-07T09:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:31.658Z",
      "updatedAt" : "2015-12-23T11:18:31.658Z",
      "deletedAt" : null,
      "endDate" : "2019-10-07T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 97,
        "username" : "User 163",
        "createdAt" : "2015-12-23T11:18:31.645Z",
        "updatedAt" : "2015-12-23T11:18:31.645Z",
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
        "id" : 91
      },
      "parent" : {
        "id" : 9
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/10"
    }
  ]
}
```
