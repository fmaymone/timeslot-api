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

<pre>Authorization: Token token=B2CnbewGQr1wdDQDDR4QwjbI5bw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/149/slots?limit=3&amp;moment=2015-11-17T23%3A46%3A18.243Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-11-17T23:46:18.243Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/149/slots?limit=3&amp;moment=2015-11-17T23%3A46%3A18.243Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=B2CnbewGQr1wdDQDDR4QwjbI5bw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ee8a4fb80e76c7b80905aae4c906f116&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 56c62bd4-bffd-4f89-adc6-c10305948a46
X-Runtime: 0.072020
Vary: Origin
Content-Length: 1942</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2015-11-17T23:46:18.243Z",
    "before" : "NjQlMjAxNS0xMS0xOCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNyAwNDo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjMlMjAxNS0xMS0yMyAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNiAwMzo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 64,
      "title" : "Slot title 120",
      "startDate" : "2015-11-18T00:00:00.000Z",
      "createdAt" : "2015-11-17T23:46:18.203Z",
      "updatedAt" : "2015-11-17T23:46:18.203Z",
      "deletedAt" : null,
      "endDate" : "2019-10-17T04:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 154,
        "username" : "User 433",
        "createdAt" : "2015-11-17T23:46:18.198Z",
        "updatedAt" : "2015-11-17T23:46:18.198Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
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
      "title" : "Slot title 118",
      "startDate" : "2015-11-23T00:00:00.000Z",
      "createdAt" : "2015-11-17T23:46:18.188Z",
      "updatedAt" : "2015-11-17T23:46:18.188Z",
      "deletedAt" : null,
      "endDate" : "2019-10-15T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 152,
        "username" : "User 431",
        "createdAt" : "2015-11-17T23:46:18.184Z",
        "updatedAt" : "2015-11-17T23:46:18.184Z",
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
      "url" : "http://example.org/v1/slots/62"
    },
    {
      "id" : 63,
      "title" : "Slot title 119",
      "startDate" : "2015-11-23T00:00:00.000Z",
      "createdAt" : "2015-11-17T23:46:18.195Z",
      "updatedAt" : "2015-11-17T23:46:18.195Z",
      "deletedAt" : null,
      "endDate" : "2019-10-16T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 153,
        "username" : "User 432",
        "createdAt" : "2015-11-17T23:46:18.191Z",
        "updatedAt" : "2015-11-17T23:46:18.191Z",
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
      "url" : "http://example.org/v1/slots/63"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=B2CnbewGQr1wdDQDDR4QwjbI5bw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/149/slots</pre>

#### Query Parameters

<pre>after: NjMlMjAxNS0xMS0yMyAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xNiAwMzo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/149/slots&quot; -X GET \
	-H &quot;Authorization: Token token=B2CnbewGQr1wdDQDDR4QwjbI5bw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e041a7bedc8255286243941e8e561598&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 87c44d17-4641-4bd3-9803-021483e39c19
X-Runtime: 0.073783
Vary: Origin
Content-Length: 1357</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "NjYlMjAxOS0wOS0xOCAwNTo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0xOCAwNTo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 66,
      "title" : "Slot title 121",
      "startDate" : "2019-09-18T05:44:02.000Z",
      "createdAt" : "2015-11-17T23:46:18.222Z",
      "updatedAt" : "2015-11-17T23:46:18.222Z",
      "deletedAt" : null,
      "endDate" : "2019-10-18T05:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 155,
        "username" : "User 434",
        "createdAt" : "2015-11-17T23:46:18.206Z",
        "updatedAt" : "2015-11-17T23:46:18.206Z",
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
      "title" : "Slot title 123",
      "startDate" : "2019-09-20T07:44:02.000Z",
      "createdAt" : "2015-11-17T23:46:18.239Z",
      "updatedAt" : "2015-11-17T23:46:18.239Z",
      "deletedAt" : null,
      "endDate" : "2019-10-20T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 158,
        "username" : "User 437",
        "createdAt" : "2015-11-17T23:46:18.226Z",
        "updatedAt" : "2015-11-17T23:46:18.226Z",
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
