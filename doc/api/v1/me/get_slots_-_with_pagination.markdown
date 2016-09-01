# Me API

## Get slots - with pagination

### GET /v1/me/slots

Response contains &#39;*paging*&#39; hash &amp; &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **mode** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes StandardSlots &amp; ReSlots the current_user has made including the slot settings (alerts).

The slots are ordered by startdate, enddate, id.

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

<pre>Authorization: Token token=01HK1yd7xpzv3YM4SZit2q62i-k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2016-08-30T09%3A50%3A53.465Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-08-30T09:50:53.465Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots?limit=3&amp;moment=2016-08-30T09%3A50%3A53.465Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=01HK1yd7xpzv3YM4SZit2q62i-k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6fe44f26683f661826e5f9564a39e335&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 727a4ff2-d399-48c2-917c-6f423525bc87
X-Runtime: 0.048967
Content-Length: 2235</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-08-30T09:50:53.465Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "NyUyMDE2LTA4LTMxIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE2IDAzOjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : "NiUyMDE2LTA5LTA1IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE1IDAyOjQ0OjAyLjAwMDAwMDAwMA==",
    "poolSize" : 3
  },
  "data" : [
    {
      "id" : 7,
      "title" : "Slot title 123",
      "description" : "",
      "startDate" : "2016-08-31T00:00:00.000Z",
      "createdAt" : "2016-08-30T09:50:53.462Z",
      "updatedAt" : "2016-08-30T09:50:53.462Z",
      "deletedAt" : null,
      "endDate" : "2019-10-16T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 19,
        "username" : "User 557",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:53.422Z",
        "updatedAt" : "2016-08-30T09:50:53.422Z",
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
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/7"
    },
    {
      "id" : 5,
      "title" : "Slot title 121",
      "description" : "",
      "startDate" : "2016-09-05T00:00:00.000Z",
      "createdAt" : "2016-08-30T09:50:53.436Z",
      "updatedAt" : "2016-08-30T09:50:53.436Z",
      "deletedAt" : null,
      "endDate" : "2019-10-14T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 19,
        "username" : "User 557",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:53.422Z",
        "updatedAt" : "2016-08-30T09:50:53.422Z",
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
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/5"
    },
    {
      "id" : 6,
      "title" : "Slot title 122",
      "description" : "",
      "startDate" : "2016-09-05T00:00:00.000Z",
      "createdAt" : "2016-08-30T09:50:53.452Z",
      "updatedAt" : "2016-08-30T09:50:53.452Z",
      "deletedAt" : null,
      "endDate" : "2019-10-15T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 19,
        "username" : "User 557",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:50:53.422Z",
        "updatedAt" : "2016-08-30T09:50:53.422Z",
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
      "url" : "http://example.org/v1/slots/6"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=01HK1yd7xpzv3YM4SZit2q62i-k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/19/slots</pre>

#### Query Parameters

<pre>after: NiUyMDE2LTA5LTA1IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE1IDAyOjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/19/slots&quot; -X GET \
	-H &quot;Authorization: Token token=01HK1yd7xpzv3YM4SZit2q62i-k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d5a4d252aca5cfac62478d0cbbdd8c9c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cd52f904-4100-46e3-beb5-216d28b5300f
X-Runtime: 0.027561
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
    "before" : "NiUyMDE2LTA5LTA1IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE1IDAyOjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : null,
    "poolSize" : 3
  },
  "data" : []
}
```
