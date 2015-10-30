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

<pre>Authorization: Token token=dgiFP2JH_V6xCx-JwgWZdaBBWf4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/187/slots?limit=3&amp;moment=2015-10-30T15%3A01%3A08.170Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-10-30T15:01:08.170Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/187/slots?limit=3&amp;moment=2015-10-30T15%3A01%3A08.170Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=dgiFP2JH_V6xCx-JwgWZdaBBWf4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7d1b7fda38c35f8fe4f746d8e3b4f7c7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d1d9083c-69d9-4782-ab30-0b254491238c
X-Runtime: 0.065224
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
    "moment" : "2015-10-30T15:01:08.170Z",
    "before" : "ODMlMjAxNS0xMC0zMSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xMyAwMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NzglMjAxNS0xMS0wMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOCAxOTo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 83,
      "title" : "Slot title 116",
      "startDate" : "2015-10-31T00:00:00.000Z",
      "createdAt" : "2015-10-30T15:01:08.168Z",
      "updatedAt" : "2015-10-30T15:01:08.168Z",
      "deletedAt" : null,
      "endDate" : "2019-10-13T00:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 196,
        "username" : "User 416",
        "createdAt" : "2015-10-30T15:01:08.164Z",
        "updatedAt" : "2015-10-30T15:01:08.164Z",
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
      "url" : "http://example.org/v1/slots/83"
    },
    {
      "id" : 77,
      "title" : "Slot title 110",
      "startDate" : "2015-11-02T00:00:00.000Z",
      "createdAt" : "2015-10-30T15:01:08.118Z",
      "updatedAt" : "2015-10-30T15:01:08.118Z",
      "deletedAt" : null,
      "endDate" : "2019-10-07T18:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 188,
        "username" : "User 408",
        "createdAt" : "2015-10-30T15:01:08.114Z",
        "updatedAt" : "2015-10-30T15:01:08.114Z",
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
      "url" : "http://example.org/v1/slots/77"
    },
    {
      "id" : 78,
      "title" : "Slot title 111",
      "startDate" : "2015-11-02T00:00:00.000Z",
      "createdAt" : "2015-10-30T15:01:08.125Z",
      "updatedAt" : "2015-10-30T15:01:08.125Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T19:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 189,
        "username" : "User 409",
        "createdAt" : "2015-10-30T15:01:08.120Z",
        "updatedAt" : "2015-10-30T15:01:08.120Z",
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
      "url" : "http://example.org/v1/slots/78"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=dgiFP2JH_V6xCx-JwgWZdaBBWf4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/187/slots</pre>

#### Query Parameters

<pre>after: NzglMjAxNS0xMS0wMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOCAxOTo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/187/slots&quot; -X GET \
	-H &quot;Authorization: Token token=dgiFP2JH_V6xCx-JwgWZdaBBWf4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;559f0d062a19da9cc6e6c0e735c587d9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 039953b3-9118-48ae-81d1-cd13628f4877
X-Runtime: 0.045422
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
    "before" : "ODAlMjAxOS0wOS0wOSAyMDo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0wOSAyMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 80,
      "title" : "Slot title 112",
      "startDate" : "2019-09-09T20:44:02.000Z",
      "createdAt" : "2015-10-30T15:01:08.142Z",
      "updatedAt" : "2015-10-30T15:01:08.142Z",
      "deletedAt" : null,
      "endDate" : "2019-10-09T20:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 190,
        "username" : "User 410",
        "createdAt" : "2015-10-30T15:01:08.127Z",
        "updatedAt" : "2015-10-30T15:01:08.127Z",
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
        "id" : 187
      },
      "parent" : {
        "id" : 79
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/80"
    },
    {
      "id" : 82,
      "title" : "Slot title 114",
      "startDate" : "2019-09-11T22:44:02.000Z",
      "createdAt" : "2015-10-30T15:01:08.160Z",
      "updatedAt" : "2015-10-30T15:01:08.160Z",
      "deletedAt" : null,
      "endDate" : "2019-10-11T22:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 193,
        "username" : "User 413",
        "createdAt" : "2015-10-30T15:01:08.147Z",
        "updatedAt" : "2015-10-30T15:01:08.147Z",
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
        "id" : 187
      },
      "parent" : {
        "id" : 81
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/82"
    }
  ]
}
```
