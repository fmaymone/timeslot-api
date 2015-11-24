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

<pre>Authorization: Token token=is-XaSDmJEZUbIDRW3Jkh2mV8Xk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2015-11-24T23%3A47%3A30.446Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-11-24T23:47:30.446Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots?limit=3&amp;moment=2015-11-24T23%3A47%3A30.446Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=is-XaSDmJEZUbIDRW3Jkh2mV8Xk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1cb305399b19ab72fc87f47d73257d1d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9e131345-3a2a-49b0-b3fe-4fdbc0a5c953
X-Runtime: 0.041886
Vary: Origin
Content-Length: 1927</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2015-11-24T23:47:30.446Z",
    "before" : "MTQlMjAxNS0xMS0yNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOCAxMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : "OSUyMDE1LTExLTMwIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTAzIDA1OjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 14,
      "title" : "Slot title 31",
      "startDate" : "2015-11-25T00:00:00.000Z",
      "createdAt" : "2015-11-24T23:47:30.445Z",
      "updatedAt" : "2015-11-24T23:47:30.445Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 110,
        "username" : "User 161",
        "createdAt" : "2015-11-24T23:47:30.440Z",
        "updatedAt" : "2015-11-24T23:47:30.440Z",
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
      "url" : "http://example.org/v1/slots/14"
    },
    {
      "id" : 8,
      "title" : "Slot title 25",
      "startDate" : "2015-11-30T00:00:00.000Z",
      "createdAt" : "2015-11-24T23:47:30.349Z",
      "updatedAt" : "2015-11-24T23:47:30.349Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T04:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 102,
        "username" : "User 153",
        "createdAt" : "2015-11-24T23:47:30.345Z",
        "updatedAt" : "2015-11-24T23:47:30.345Z",
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
      "url" : "http://example.org/v1/slots/8"
    },
    {
      "id" : 9,
      "title" : "Slot title 26",
      "startDate" : "2015-11-30T00:00:00.000Z",
      "createdAt" : "2015-11-24T23:47:30.356Z",
      "updatedAt" : "2015-11-24T23:47:30.356Z",
      "deletedAt" : null,
      "endDate" : "2019-10-03T05:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 103,
        "username" : "User 154",
        "createdAt" : "2015-11-24T23:47:30.352Z",
        "updatedAt" : "2015-11-24T23:47:30.352Z",
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
      "url" : "http://example.org/v1/slots/9"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=is-XaSDmJEZUbIDRW3Jkh2mV8Xk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/101/slots</pre>

#### Query Parameters

<pre>after: OSUyMDE1LTExLTMwIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTAzIDA1OjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/101/slots&quot; -X GET \
	-H &quot;Authorization: Token token=is-XaSDmJEZUbIDRW3Jkh2mV8Xk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4216008b239ee9977e9a657e73fc2f55&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f1abe92b-4888-4e55-969e-003902982610
X-Runtime: 0.042056
Vary: Origin
Content-Length: 1349</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "MTElMjAxOS0wOS0wNCAwNjo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0wNCAwNjo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 11,
      "title" : "Slot title 27",
      "startDate" : "2019-09-04T06:44:02.000Z",
      "createdAt" : "2015-11-24T23:47:30.373Z",
      "updatedAt" : "2015-11-24T23:47:30.373Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T06:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 104,
        "username" : "User 155",
        "createdAt" : "2015-11-24T23:47:30.358Z",
        "updatedAt" : "2015-11-24T23:47:30.358Z",
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
        "id" : 101
      },
      "parent" : {
        "id" : 10
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/11"
    },
    {
      "id" : 13,
      "title" : "Slot title 29",
      "startDate" : "2019-09-06T08:44:02.000Z",
      "createdAt" : "2015-11-24T23:47:30.418Z",
      "updatedAt" : "2015-11-24T23:47:30.418Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 107,
        "username" : "User 158",
        "createdAt" : "2015-11-24T23:47:30.405Z",
        "updatedAt" : "2015-11-24T23:47:30.405Z",
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
        "id" : 101
      },
      "parent" : {
        "id" : 12
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/13"
    }
  ]
}
```
