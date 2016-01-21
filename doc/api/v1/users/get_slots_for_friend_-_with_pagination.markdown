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

<pre>Authorization: Token token=nBSLVI9qrBDVQVyKb9F7h-kK_XM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/146/slots?limit=3&amp;moment=2016-01-21T23%3A11%3A43.443Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-01-21T23:11:43.443Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/146/slots?limit=3&amp;moment=2016-01-21T23%3A11%3A43.443Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=nBSLVI9qrBDVQVyKb9F7h-kK_XM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;d07541286b0aeeeb5bf0900d69c8d720&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a6bb281c-5d29-4bed-895d-384371dbe433
X-Runtime: 0.040317
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
    "moment" : "2016-01-21T23:11:43.443Z",
    "before" : "NjIlMjAxNi0wMS0yMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMiAwOTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjElMjAxNi0wMS0yNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMSAwODo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 62,
      "title" : "Slot title 125",
      "startDate" : "2016-01-22T00:00:00.000Z",
      "createdAt" : "2016-01-21T23:11:43.361Z",
      "updatedAt" : "2016-01-21T23:11:43.361Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 151,
        "username" : "User 452",
        "createdAt" : "2016-01-21T23:11:43.356Z",
        "updatedAt" : "2016-01-21T23:11:43.356Z",
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
      "url" : "http://example.org/v1/slots/62"
    },
    {
      "id" : 60,
      "title" : "Slot title 123",
      "startDate" : "2016-01-25T00:00:00.000Z",
      "createdAt" : "2016-01-21T23:11:43.346Z",
      "updatedAt" : "2016-01-21T23:11:43.346Z",
      "deletedAt" : null,
      "endDate" : "2019-10-20T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 149,
        "username" : "User 450",
        "createdAt" : "2016-01-21T23:11:43.342Z",
        "updatedAt" : "2016-01-21T23:11:43.342Z",
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
      "url" : "http://example.org/v1/slots/60"
    },
    {
      "id" : 61,
      "title" : "Slot title 124",
      "startDate" : "2016-01-25T00:00:00.000Z",
      "createdAt" : "2016-01-21T23:11:43.353Z",
      "updatedAt" : "2016-01-21T23:11:43.353Z",
      "deletedAt" : null,
      "endDate" : "2019-10-21T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 150,
        "username" : "User 451",
        "createdAt" : "2016-01-21T23:11:43.349Z",
        "updatedAt" : "2016-01-21T23:11:43.349Z",
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
      "url" : "http://example.org/v1/slots/61"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=nBSLVI9qrBDVQVyKb9F7h-kK_XM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/146/slots</pre>

#### Query Parameters

<pre>after: NjElMjAxNi0wMS0yNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMSAwODo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/146/slots&quot; -X GET \
	-H &quot;Authorization: Token token=nBSLVI9qrBDVQVyKb9F7h-kK_XM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c3d8e549922d6cff5c56b6f71952d543&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9acfa45e-e000-4d81-adb8-1e1efc665437
X-Runtime: 0.034859
Vary: Origin
Content-Length: 1352</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 100,
    "filter" : null,
    "moment" : null,
    "before" : "NjQlMjAxOS0wOS0yMyAxMDo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0yMyAxMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 64,
      "title" : "Slot title 126",
      "startDate" : "2019-09-23T10:44:02.000Z",
      "createdAt" : "2016-01-21T23:11:43.382Z",
      "updatedAt" : "2016-01-21T23:11:43.382Z",
      "deletedAt" : null,
      "endDate" : "2019-10-23T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 152,
        "username" : "User 453",
        "createdAt" : "2016-01-21T23:11:43.364Z",
        "updatedAt" : "2016-01-21T23:11:43.364Z",
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
        "id" : 146
      },
      "parent" : {
        "id" : 63
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/64"
    },
    {
      "id" : 66,
      "title" : "Slot title 128",
      "startDate" : "2019-09-25T12:44:02.000Z",
      "createdAt" : "2016-01-21T23:11:43.420Z",
      "updatedAt" : "2016-01-21T23:11:43.420Z",
      "deletedAt" : null,
      "endDate" : "2019-10-25T12:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 155,
        "username" : "User 456",
        "createdAt" : "2016-01-21T23:11:43.407Z",
        "updatedAt" : "2016-01-21T23:11:43.407Z",
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
        "id" : 146
      },
      "parent" : {
        "id" : 65
      },
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/66"
    }
  ]
}
```
