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

<pre>Authorization: Token token=DWWJvD8zm3LE5DpQol4vK0izN9I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2016-01-21T23%3A11%3A37.678Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-01-21T23:11:37.678Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots?limit=3&amp;moment=2016-01-21T23%3A11%3A37.678Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=DWWJvD8zm3LE5DpQol4vK0izN9I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ebb19a5e07d73cf69aee76117d171e23&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 567cf06a-c196-4427-8df7-113baf3dd29c
X-Runtime: 0.040717
Vary: Origin
Content-Length: 1922</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2016-01-21T23:11:37.678Z",
    "before" : "NyUyMDE2LTAxLTIyIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTExIDEzOjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : "MiUyMDE2LTAxLTI1IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTA2IDA4OjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 7,
      "title" : "Slot title 34",
      "startDate" : "2016-01-22T00:00:00.000Z",
      "createdAt" : "2016-01-21T23:11:37.676Z",
      "updatedAt" : "2016-01-21T23:11:37.676Z",
      "deletedAt" : null,
      "endDate" : "2019-10-11T13:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 94,
        "username" : "User 172",
        "createdAt" : "2016-01-21T23:11:37.672Z",
        "updatedAt" : "2016-01-21T23:11:37.672Z",
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
      "url" : "http://example.org/v1/slots/7"
    },
    {
      "id" : 1,
      "title" : "Slot title 28",
      "startDate" : "2016-01-25T00:00:00.000Z",
      "createdAt" : "2016-01-21T23:11:37.568Z",
      "updatedAt" : "2016-01-21T23:11:37.568Z",
      "deletedAt" : null,
      "endDate" : "2019-10-05T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 86,
        "username" : "User 164",
        "createdAt" : "2016-01-21T23:11:37.560Z",
        "updatedAt" : "2016-01-21T23:11:37.560Z",
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
      "url" : "http://example.org/v1/slots/1"
    },
    {
      "id" : 2,
      "title" : "Slot title 29",
      "startDate" : "2016-01-25T00:00:00.000Z",
      "createdAt" : "2016-01-21T23:11:37.577Z",
      "updatedAt" : "2016-01-21T23:11:37.577Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 87,
        "username" : "User 165",
        "createdAt" : "2016-01-21T23:11:37.573Z",
        "updatedAt" : "2016-01-21T23:11:37.573Z",
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
      "url" : "http://example.org/v1/slots/2"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=DWWJvD8zm3LE5DpQol4vK0izN9I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/85/slots</pre>

#### Query Parameters

<pre>after: MiUyMDE2LTAxLTI1IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTA2IDA4OjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/85/slots&quot; -X GET \
	-H &quot;Authorization: Token token=DWWJvD8zm3LE5DpQol4vK0izN9I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;02585246e8873721235ef992c441568c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3716303f-c179-4736-a591-91ab5d009223
X-Runtime: 0.037099
Vary: Origin
Content-Length: 1340</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 100,
    "filter" : null,
    "moment" : null,
    "before" : "NCUyMDE5LTA5LTA3IDA5OjQ0OjAyLjAwMDAwMDAwMCUyMDE5LTEwLTA3IDA5OjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : null
  },
  "data" : [
    {
      "id" : 4,
      "title" : "Slot title 30",
      "startDate" : "2019-09-07T09:44:02.000Z",
      "createdAt" : "2016-01-21T23:11:37.595Z",
      "updatedAt" : "2016-01-21T23:11:37.595Z",
      "deletedAt" : null,
      "endDate" : "2019-10-07T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 88,
        "username" : "User 166",
        "createdAt" : "2016-01-21T23:11:37.580Z",
        "updatedAt" : "2016-01-21T23:11:37.580Z",
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
        "id" : 85
      },
      "parent" : {
        "id" : 3
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/4"
    },
    {
      "id" : 6,
      "title" : "Slot title 32",
      "startDate" : "2019-09-09T11:44:02.000Z",
      "createdAt" : "2016-01-21T23:11:37.646Z",
      "updatedAt" : "2016-01-21T23:11:37.646Z",
      "deletedAt" : null,
      "endDate" : "2019-10-09T11:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 91,
        "username" : "User 169",
        "createdAt" : "2016-01-21T23:11:37.629Z",
        "updatedAt" : "2016-01-21T23:11:37.629Z",
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
        "id" : 85
      },
      "parent" : {
        "id" : 5
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/6"
    }
  ]
}
```
