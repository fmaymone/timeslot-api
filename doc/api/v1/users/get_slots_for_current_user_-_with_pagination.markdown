# Users API

## Get slots for current user - with pagination

### GET /v1/users/:id/slots

Response contains a &#39;*paging*&#39; hash and a &#39;*data*&#39; array.
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

<pre>Authorization: Token token=z8HCd6OyOMjhxp0t2ed7_txxEcE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/171/slots?limit=3&amp;moment=2015-11-17T12%3A12%3A43.233Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-11-17T12:12:43.233Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/171/slots?limit=3&amp;moment=2015-11-17T12%3A12%3A43.233Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=z8HCd6OyOMjhxp0t2ed7_txxEcE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cee66bf2f7c73b8ab40ebd3f18651781&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f3737a69-11df-4ed5-89d7-5072aba5e0c0
X-Runtime: 0.100870
Vary: Origin
Content-Length: 2033</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "filter" : "upcoming",
    "moment" : "2015-11-17T12:12:43.233Z",
    "before" : "NzUlMjAxNS0xMS0xOCAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xMCAyMTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NzAlMjAxNS0xMS0yMyAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wNSAxNjo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 75,
      "title" : "Slot title 113",
      "startDate" : "2015-11-18T00:00:00.000Z",
      "createdAt" : "2015-11-17T12:12:43.232Z",
      "updatedAt" : "2015-11-17T12:12:43.232Z",
      "deletedAt" : null,
      "endDate" : "2019-10-10T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 180,
        "username" : "User 424",
        "createdAt" : "2015-11-17T12:12:43.227Z",
        "updatedAt" : "2015-11-17T12:12:43.227Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
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
      "url" : "http://example.org/v1/slots/75"
    },
    {
      "id" : 69,
      "title" : "Slot title 107",
      "startDate" : "2015-11-23T00:00:00.000Z",
      "createdAt" : "2015-11-17T12:12:43.180Z",
      "updatedAt" : "2015-11-17T12:12:43.180Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T15:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 172,
        "username" : "User 416",
        "createdAt" : "2015-11-17T12:12:43.176Z",
        "updatedAt" : "2015-11-17T12:12:43.176Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
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
      "url" : "http://example.org/v1/slots/69"
    },
    {
      "id" : 70,
      "title" : "Slot title 108",
      "startDate" : "2015-11-23T00:00:00.000Z",
      "createdAt" : "2015-11-17T12:12:43.187Z",
      "updatedAt" : "2015-11-17T12:12:43.187Z",
      "deletedAt" : null,
      "endDate" : "2019-10-05T16:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 173,
        "username" : "User 417",
        "createdAt" : "2015-11-17T12:12:43.183Z",
        "updatedAt" : "2015-11-17T12:12:43.183Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
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
      "url" : "http://example.org/v1/slots/70"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=z8HCd6OyOMjhxp0t2ed7_txxEcE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/171/slots</pre>

#### Query Parameters

<pre>after: NzAlMjAxNS0xMS0yMyAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wNSAxNjo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/171/slots&quot; -X GET \
	-H &quot;Authorization: Token token=z8HCd6OyOMjhxp0t2ed7_txxEcE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;dbfe584df4da1f3b334689892a7e4431&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2a3e53dd-84a8-4505-9016-953f7b6abc56
X-Runtime: 0.047864
Vary: Origin
Content-Length: 1417</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "filter" : null,
    "moment" : null,
    "before" : "NzIlMjAxOS0wOS0wNiAxNzo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0wNiAxNzo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 72,
      "title" : "Slot title 109",
      "startDate" : "2019-09-06T17:44:02.000Z",
      "createdAt" : "2015-11-17T12:12:43.204Z",
      "updatedAt" : "2015-11-17T12:12:43.204Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T17:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 174,
        "username" : "User 418",
        "createdAt" : "2015-11-17T12:12:43.189Z",
        "updatedAt" : "2015-11-17T12:12:43.189Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "reslotsCounter" : 1,
      "slotter" : {
        "id" : 171
      },
      "parent" : {
        "id" : 71
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/72"
    },
    {
      "id" : 74,
      "title" : "Slot title 111",
      "startDate" : "2019-09-08T19:44:02.000Z",
      "createdAt" : "2015-11-17T12:12:43.222Z",
      "updatedAt" : "2015-11-17T12:12:43.222Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T19:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 177,
        "username" : "User 421",
        "createdAt" : "2015-11-17T12:12:43.209Z",
        "updatedAt" : "2015-11-17T12:12:43.209Z",
        "deletedAt" : null,
        "image" : {
          "publicId" : null,
          "localId" : null
        }
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "0000000000"
      },
      "reslotsCounter" : 1,
      "slotter" : {
        "id" : 171
      },
      "parent" : {
        "id" : 73
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/74"
    }
  ]
}
```
