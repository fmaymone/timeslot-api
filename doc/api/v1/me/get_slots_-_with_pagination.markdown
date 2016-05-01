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

<pre>Authorization: Token token=B5sBBXDXyKPXIHjX4WJ2j7DZFhU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2016-05-01T22%3A54%3A10.498Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-05-01T22:54:10.498Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots?limit=3&amp;moment=2016-05-01T22%3A54%3A10.498Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=B5sBBXDXyKPXIHjX4WJ2j7DZFhU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;89f48e9322a6a89b74f8a5864a887f44&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b8e32be3-9090-4a30-9980-9ef11de4a890
X-Runtime: 0.029905
Content-Length: 1901</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-05-01T22:54:10.498Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "NiUyMDE2LTA1LTAyIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE3IDAxOjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : "NSUyMDE2LTA1LTA5IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE2IDAwOjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 6,
      "title" : "Slot title 94",
      "startDate" : "2016-05-02T00:00:00.000Z",
      "createdAt" : "2016-05-01T22:54:10.481Z",
      "updatedAt" : "2016-05-01T22:54:10.481Z",
      "deletedAt" : null,
      "endDate" : "2019-10-17T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 23,
        "username" : "User 334",
        "createdAt" : "2016-05-01T22:54:10.475Z",
        "updatedAt" : "2016-05-01T22:54:10.475Z",
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
      "url" : "http://example.org/v1/slots/6"
    },
    {
      "id" : 7,
      "title" : "Slot title 95",
      "startDate" : "2016-05-02T00:00:00.000Z",
      "createdAt" : "2016-05-01T22:54:10.494Z",
      "updatedAt" : "2016-05-01T22:54:10.494Z",
      "deletedAt" : null,
      "endDate" : "2019-10-18T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 24,
        "username" : "User 335",
        "createdAt" : "2016-05-01T22:54:10.485Z",
        "updatedAt" : "2016-05-01T22:54:10.485Z",
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
      "url" : "http://example.org/v1/slots/7"
    },
    {
      "id" : 5,
      "title" : "Slot title 93",
      "startDate" : "2016-05-09T00:00:00.000Z",
      "createdAt" : "2016-05-01T22:54:10.473Z",
      "updatedAt" : "2016-05-01T22:54:10.473Z",
      "deletedAt" : null,
      "endDate" : "2019-10-16T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 22,
        "username" : "User 333",
        "createdAt" : "2016-05-01T22:54:10.468Z",
        "updatedAt" : "2016-05-01T22:54:10.468Z",
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
      "url" : "http://example.org/v1/slots/5"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=B5sBBXDXyKPXIHjX4WJ2j7DZFhU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/21/slots</pre>

#### Query Parameters

<pre>after: NSUyMDE2LTA1LTA5IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE2IDAwOjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/21/slots&quot; -X GET \
	-H &quot;Authorization: Token token=B5sBBXDXyKPXIHjX4WJ2j7DZFhU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;63e09dc675781e6749785dee24ad7c04&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f9ad39c1-c438-4d37-9408-b26839b8f602
X-Runtime: 0.025305
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
