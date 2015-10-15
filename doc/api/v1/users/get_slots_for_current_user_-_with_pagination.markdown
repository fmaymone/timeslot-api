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

<pre>Authorization: Token token=eKR5HOA4aMEmXtkBl8STYeuI6fo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/187/slots?limit=3&amp;moment=2015-10-14T11%3A50%3A03.244Z&amp;filter=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-10-14T11:50:03.244Z
filter: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/187/slots?limit=3&amp;moment=2015-10-14T11%3A50%3A03.244Z&amp;filter=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=eKR5HOA4aMEmXtkBl8STYeuI6fo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;92314bbde4755b09b9461482243e0f92&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70782774-60ad-4357-9ebb-361c03b63c6e
X-Runtime: 0.130930
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
    "moment" : "2015-10-14T11:50:03.244Z",
    "before" : "ODMlMjAxNS0xMC0xNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0xMCAyMTo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NzglMjAxNS0xMC0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wNSAxNjo0NDowMi4wMDAwMDAwMDA="
  },
  "data" : [
    {
      "id" : 83,
      "title" : "Slot title 116",
      "startDate" : "2015-10-15T00:00:00.000Z",
      "createdAt" : "2015-10-14T11:50:03.235Z",
      "updatedAt" : "2015-10-14T11:50:03.235Z",
      "deletedAt" : null,
      "endDate" : "2019-10-10T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 196,
        "username" : "User 409",
        "createdAt" : "2015-10-14T11:50:03.229Z",
        "updatedAt" : "2015-10-14T11:50:03.229Z",
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
      "startDate" : "2015-10-19T00:00:00.000Z",
      "createdAt" : "2015-10-14T11:50:03.164Z",
      "updatedAt" : "2015-10-14T11:50:03.164Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T15:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 188,
        "username" : "User 401",
        "createdAt" : "2015-10-14T11:50:03.158Z",
        "updatedAt" : "2015-10-14T11:50:03.158Z",
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
      "startDate" : "2015-10-19T00:00:00.000Z",
      "createdAt" : "2015-10-14T11:50:03.172Z",
      "updatedAt" : "2015-10-14T11:50:03.172Z",
      "deletedAt" : null,
      "endDate" : "2019-10-05T16:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 189,
        "username" : "User 402",
        "createdAt" : "2015-10-14T11:50:03.167Z",
        "updatedAt" : "2015-10-14T11:50:03.167Z",
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

<pre>Authorization: Token token=eKR5HOA4aMEmXtkBl8STYeuI6fo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/187/slots</pre>

#### Query Parameters

<pre>after: NzglMjAxNS0xMC0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wNSAxNjo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/187/slots&quot; -X GET \
	-H &quot;Authorization: Token token=eKR5HOA4aMEmXtkBl8STYeuI6fo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2c5274c36f30111688828d09cbca7529&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 13540204-c70b-4842-84aa-cf01184f02fe
X-Runtime: 0.084371
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
    "before" : "ODAlMjAxOS0wOS0wNiAxNzo0NDowMi4wMDAwMDAwMDAlMjAxOS0xMC0wNiAxNzo0NDowMi4wMDAwMDAwMDA=",
    "after" : null
  },
  "data" : [
    {
      "id" : 80,
      "title" : "Slot title 112",
      "startDate" : "2019-09-06T17:44:02.000Z",
      "createdAt" : "2015-10-14T11:50:03.197Z",
      "updatedAt" : "2015-10-14T11:50:03.197Z",
      "deletedAt" : null,
      "endDate" : "2019-10-06T17:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 190,
        "username" : "User 403",
        "createdAt" : "2015-10-14T11:50:03.175Z",
        "updatedAt" : "2015-10-14T11:50:03.175Z",
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
      "startDate" : "2019-09-08T19:44:02.000Z",
      "createdAt" : "2015-10-14T11:50:03.224Z",
      "updatedAt" : "2015-10-14T11:50:03.224Z",
      "deletedAt" : null,
      "endDate" : "2019-10-08T19:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 193,
        "username" : "User 406",
        "createdAt" : "2015-10-14T11:50:03.205Z",
        "updatedAt" : "2015-10-14T11:50:03.205Z",
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
