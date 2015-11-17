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

<pre>Authorization: Token token=4XvkYq25w-8qHRavuU0k0kDyTwc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2015-11-17T23%3A46%3A12.042Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-11-17T23:46:12.042Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/slots?limit=3&amp;moment=2015-11-17T23%3A46%3A12.042Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=4XvkYq25w-8qHRavuU0k0kDyTwc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b549eb01ca8d25635d536fd948cf36af&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9851b287-47c2-440a-9fc0-d6d29bbf47e4
X-Runtime: 0.059377
Vary: Origin
Content-Length: 1936</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2015-11-17T23:46:12.042Z",
    "before" : "MTQlMjAxNS0xMS0xOCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOCAxMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : "OSUyMDE1LTExLTIzIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTAzIDA1OjQ0OjAyLjAwMDAwMDAwMA=="
  },
  "data" : [
    {
      "id" : 14,
      "title" : "Slot title 31",
      "startDate" : "2015-11-18T00:00:00.000Z",
      "createdAt" : "2015-11-17T23:46:12.041Z",
      "updatedAt" : "2015-11-17T23:46:12.041Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 110,
        "username" : "User 165",
        "createdAt" : "2015-11-17T23:46:12.037Z",
        "updatedAt" : "2015-11-17T23:46:12.037Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
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
      "startDate" : "2015-11-23T00:00:00.000Z",
      "createdAt" : "2015-11-17T23:46:11.985Z",
      "updatedAt" : "2015-11-17T23:46:11.985Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T04:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 102,
        "username" : "User 157",
        "createdAt" : "2015-11-17T23:46:11.980Z",
        "updatedAt" : "2015-11-17T23:46:11.980Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
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
      "startDate" : "2015-11-23T00:00:00.000Z",
      "createdAt" : "2015-11-17T23:46:11.993Z",
      "updatedAt" : "2015-11-17T23:46:11.993Z",
      "deletedAt" : null,
      "endDate" : "2019-10-03T05:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 103,
        "username" : "User 158",
        "createdAt" : "2015-11-17T23:46:11.988Z",
        "updatedAt" : "2015-11-17T23:46:11.988Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
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

<pre>Authorization: Token token=4XvkYq25w-8qHRavuU0k0kDyTwc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/101/slots</pre>

#### Query Parameters

<pre>after: OSUyMDE1LTExLTIzIDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTAzIDA1OjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/101/slots&quot; -X GET \
	-H &quot;Authorization: Token token=4XvkYq25w-8qHRavuU0k0kDyTwc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3f805f21cb1d6e988c6390aca7185266&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6d257266-f5d4-42ac-8348-222d1fd4a7e2
X-Runtime: 0.077488
Vary: Origin
Content-Length: 1355</pre>

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
      "createdAt" : "2015-11-17T23:46:12.011Z",
      "updatedAt" : "2015-11-17T23:46:12.011Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T06:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 104,
        "username" : "User 159",
        "createdAt" : "2015-11-17T23:46:11.995Z",
        "updatedAt" : "2015-11-17T23:46:11.995Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
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
      "createdAt" : "2015-11-17T23:46:12.032Z",
      "updatedAt" : "2015-11-17T23:46:12.032Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 107,
        "username" : "User 162",
        "createdAt" : "2015-11-17T23:46:12.015Z",
        "updatedAt" : "2015-11-17T23:46:12.015Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
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
