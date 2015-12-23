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

<pre>Authorization: Token token=iiQFC-yjlPbr9K_B8Zd2Vz_0eOk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/149/slots?limit=3&amp;moment=2015-12-23T11%3A18%3A37.574Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-12-23T11:18:37.574Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/149/slots?limit=3&amp;moment=2015-12-23T11%3A18%3A37.574Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=iiQFC-yjlPbr9K_B8Zd2Vz_0eOk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4175dfb86beb8b76fa1f29a1774634b8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7bac8123-4918-498c-aa1e-f673b6a2f20f
X-Runtime: 0.033901
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
    "moment" : "2015-12-23T11:18:37.574Z",
    "before" : "NjQlMjAxNS0xMi0yNCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yNCAxMTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjMlMjAxNS0xMi0yOCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMyAxMDo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 64,
      "title" : "Slot title 127",
      "startDate" : "2015-12-24T00:00:00.000Z",
      "createdAt" : "2015-12-23T11:18:37.489Z",
      "updatedAt" : "2015-12-23T11:18:37.489Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T11:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 154,
        "username" : "User 447",
        "createdAt" : "2015-12-23T11:18:37.484Z",
        "updatedAt" : "2015-12-23T11:18:37.484Z",
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
      "title" : "Slot title 125",
      "startDate" : "2015-12-28T00:00:00.000Z",
      "createdAt" : "2015-12-23T11:18:37.473Z",
      "updatedAt" : "2015-12-23T11:18:37.473Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T09:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 152,
        "username" : "User 445",
        "createdAt" : "2015-12-23T11:18:37.469Z",
        "updatedAt" : "2015-12-23T11:18:37.469Z",
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
      "title" : "Slot title 126",
      "startDate" : "2015-12-28T00:00:00.000Z",
      "createdAt" : "2015-12-23T11:18:37.480Z",
      "updatedAt" : "2015-12-23T11:18:37.480Z",
      "deletedAt" : null,
      "endDate" : "2019-10-23T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 153,
        "username" : "User 446",
        "createdAt" : "2015-12-23T11:18:37.476Z",
        "updatedAt" : "2015-12-23T11:18:37.476Z",
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

<pre>Authorization: Token token=iiQFC-yjlPbr9K_B8Zd2Vz_0eOk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/149/slots</pre>

#### Query Parameters

<pre>after: NjMlMjAxNS0xMi0yOCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMyAxMDo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/149/slots&quot; -X GET \
	-H &quot;Authorization: Token token=iiQFC-yjlPbr9K_B8Zd2Vz_0eOk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a58baf930725f7dd3cfc465e73068fdc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bb09742b-c1ef-4970-a0be-d0d87817535e
X-Runtime: 0.033899
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
    "before" : "NjYlMjAxOS0wOS0yNSAxMjo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0yNSAxMjo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 66,
      "title" : "Slot title 128",
      "startDate" : "2019-09-25T12:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:37.511Z",
      "updatedAt" : "2015-12-23T11:18:37.511Z",
      "deletedAt" : null,
      "endDate" : "2019-10-25T12:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 155,
        "username" : "User 448",
        "createdAt" : "2015-12-23T11:18:37.492Z",
        "updatedAt" : "2015-12-23T11:18:37.492Z",
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
      "title" : "Slot title 130",
      "startDate" : "2019-09-27T14:44:02.000Z",
      "createdAt" : "2015-12-23T11:18:37.552Z",
      "updatedAt" : "2015-12-23T11:18:37.552Z",
      "deletedAt" : null,
      "endDate" : "2019-10-27T14:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 158,
        "username" : "User 451",
        "createdAt" : "2015-12-23T11:18:37.539Z",
        "updatedAt" : "2015-12-23T11:18:37.539Z",
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
