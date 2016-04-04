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

<pre>Authorization: Token token=qshY-aj6_HJYGxV4S-ho_agMC1Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2016-04-04T20%3A50%3A23.865Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-04-04T20:50:23.865Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots?limit=3&amp;moment=2016-04-04T20%3A50%3A23.865Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=qshY-aj6_HJYGxV4S-ho_agMC1Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3d0b943369ff79c8b0aa23f1659ae622&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d6b46809-4d1e-46e6-aaae-707821f18512
X-Runtime: 0.031427
Vary: Origin
Content-Length: 1817</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2016-04-04T20:50:23.865Z",
    "before" : "NyUyMDE2LTA0LTA1IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTEyIDE0OjQ0OjAyLjAwMDAwMDAwMA==",
    "after" : "NiUyMDE2LTA0LTExIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTExIDEzOjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 7,
      "title" : "Slot title 35",
      "startDate" : "2016-04-05T00:00:00.000Z",
      "createdAt" : "2016-04-04T20:50:23.862Z",
      "updatedAt" : "2016-04-04T20:50:23.862Z",
      "deletedAt" : null,
      "endDate" : "2019-10-12T14:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 19,
        "username" : "User 181",
        "createdAt" : "2016-04-04T20:50:23.857Z",
        "updatedAt" : "2016-04-04T20:50:23.857Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "private",
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/7"
    },
    {
      "id" : 5,
      "title" : "Slot title 33",
      "startDate" : "2016-04-11T00:00:00.000Z",
      "createdAt" : "2016-04-04T20:50:23.847Z",
      "updatedAt" : "2016-04-04T20:50:23.847Z",
      "deletedAt" : null,
      "endDate" : "2019-10-10T12:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 17,
        "username" : "User 179",
        "createdAt" : "2016-04-04T20:50:23.841Z",
        "updatedAt" : "2016-04-04T20:50:23.841Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "private",
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/5"
    },
    {
      "id" : 6,
      "title" : "Slot title 34",
      "startDate" : "2016-04-11T00:00:00.000Z",
      "createdAt" : "2016-04-04T20:50:23.855Z",
      "updatedAt" : "2016-04-04T20:50:23.855Z",
      "deletedAt" : null,
      "endDate" : "2019-10-11T13:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 18,
        "username" : "User 180",
        "createdAt" : "2016-04-04T20:50:23.850Z",
        "updatedAt" : "2016-04-04T20:50:23.850Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "friends",
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/6"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=qshY-aj6_HJYGxV4S-ho_agMC1Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/16/slots</pre>

#### Query Parameters

<pre>after: NiUyMDE2LTA0LTExIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTExIDEzOjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/16/slots&quot; -X GET \
	-H &quot;Authorization: Token token=qshY-aj6_HJYGxV4S-ho_agMC1Y&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;83ff2969a953539e8e6eaa89bc752267&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e12b8842-6d5d-4247-b342-3f369835edce
X-Runtime: 0.024646
Vary: Origin
Content-Length: 89</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 100,
    "filter" : null,
    "moment" : null,
    "before" : null,
    "after" : null
  },
  "data" : []
}
```
