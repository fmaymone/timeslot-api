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

<pre>Authorization: Token token=JC-AftNb47Ly4xNjwWa8uvT-rGg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/150/slots?limit=3&amp;moment=2016-04-04T20%3A50%3A34.177Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-04-04T20:50:34.177Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/150/slots?limit=3&amp;moment=2016-04-04T20%3A50%3A34.177Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=JC-AftNb47Ly4xNjwWa8uvT-rGg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7b66580890d7b43ac6a2882d674bcb6f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b02e02e6-d579-4292-8d54-149cf158f9a9
X-Runtime: 0.023207
Vary: Origin
Content-Length: 1828</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2016-04-04T20:50:34.177Z",
    "before" : "NTYlMjAxNi0wNC0wNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNSAwMjo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NTUlMjAxNi0wNC0xMSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNCAwMTo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 56,
      "title" : "Slot title 119",
      "startDate" : "2016-04-05T00:00:00.000Z",
      "createdAt" : "2016-04-04T20:50:34.174Z",
      "updatedAt" : "2016-04-04T20:50:34.174Z",
      "deletedAt" : null,
      "endDate" : "2019-10-15T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 155,
        "username" : "User 455",
        "createdAt" : "2016-04-04T20:50:34.166Z",
        "updatedAt" : "2016-04-04T20:50:34.166Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "url" : "http://example.org/v1/slots/56"
    },
    {
      "id" : 54,
      "title" : "Slot title 117",
      "startDate" : "2016-04-11T00:00:00.000Z",
      "createdAt" : "2016-04-04T20:50:34.154Z",
      "updatedAt" : "2016-04-04T20:50:34.154Z",
      "deletedAt" : null,
      "endDate" : "2019-10-13T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 153,
        "username" : "User 453",
        "createdAt" : "2016-04-04T20:50:34.147Z",
        "updatedAt" : "2016-04-04T20:50:34.147Z",
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
      "url" : "http://example.org/v1/slots/54"
    },
    {
      "id" : 55,
      "title" : "Slot title 118",
      "startDate" : "2016-04-11T00:00:00.000Z",
      "createdAt" : "2016-04-04T20:50:34.163Z",
      "updatedAt" : "2016-04-04T20:50:34.163Z",
      "deletedAt" : null,
      "endDate" : "2019-10-14T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 154,
        "username" : "User 454",
        "createdAt" : "2016-04-04T20:50:34.158Z",
        "updatedAt" : "2016-04-04T20:50:34.158Z",
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
      "url" : "http://example.org/v1/slots/55"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=JC-AftNb47Ly4xNjwWa8uvT-rGg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/150/slots</pre>

#### Query Parameters

<pre>after: NTUlMjAxNi0wNC0xMSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNCAwMTo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/150/slots&quot; -X GET \
	-H &quot;Authorization: Token token=JC-AftNb47Ly4xNjwWa8uvT-rGg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;83ff2969a953539e8e6eaa89bc752267&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7bbe56ed-4e28-4e60-b2f0-cce3b15d232a
X-Runtime: 0.012866
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
