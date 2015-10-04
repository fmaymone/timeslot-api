# Users API

## Get slots for current user - with pagination

### GET /v1/users/:id/slots

Response contains a &#39;*paging*&#39; hash and a &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **status** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes StandardSlots &amp; ReSlots

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

Name : status
Description : Query parameter to filter slots relative to a point-in-time. Must be one of [past, ongoing, upcoming, now, around, all].
Default is &#39;upcoming&#39;. 

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **status** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **status** and **moment** are ignored.


### Response Fields

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : status
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

<pre>Authorization: Token token=pAsfCcVmuqwHqhjjRZKGRRIZ_BU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/416/slots?limit=3&amp;moment=2015-10-04T20%3A11%3A46.418Z&amp;status=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2015-10-04T20:11:46.418Z
status: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/416/slots?limit=3&amp;moment=2015-10-04T20%3A11%3A46.418Z&amp;status=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=pAsfCcVmuqwHqhjjRZKGRRIZ_BU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;98359489e0fd420959f4d83a6f2310e8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5644e70-db1a-49f9-9e6c-fce68fd10156
X-Runtime: 0.063083
Vary: Origin
Content-Length: 1982</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "status" : "upcoming",
    "moment" : "2015-10-04T20:11:46.418Z",
    "before" : "MTI2JTIwMTUtMTAtMDUgMDA6MDA6MDAuMDAwMDAwMDAwJTIwMTktMTAtMDQgMTU6NDQ6MDIuMDAwMDAwMDAw",
    "after" : "MTE4JTIwMTUtMTAtMTIgMDA6MDA6MDAuMDAwMDAwMDAwJTIwMTktMTAtMjMgMDc6NDQ6MDIuMDAwMDAwMDAw"
  },
  "data" : [
    {
      "id" : 126,
      "title" : "Slot title 111",
      "startDate" : "2015-10-05T00:00:00.000Z",
      "createdAt" : "2015-10-04T20:11:46.416Z",
      "updatedAt" : "2015-10-04T20:11:46.416Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T15:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 429,
        "username" : "User 391",
        "createdAt" : "2015-10-04T20:11:46.410Z",
        "updatedAt" : "2015-10-04T20:11:46.410Z",
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
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/126"
    },
    {
      "id" : 119,
      "title" : "Slot title 104",
      "startDate" : "2015-10-05T00:00:00.000Z",
      "createdAt" : "2015-10-04T20:11:46.318Z",
      "updatedAt" : "2015-10-04T20:11:46.318Z",
      "deletedAt" : null,
      "endDate" : "2019-10-24T08:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 418,
        "username" : "User 380",
        "createdAt" : "2015-10-04T20:11:46.313Z",
        "updatedAt" : "2015-10-04T20:11:46.313Z",
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
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/119"
    },
    {
      "id" : 118,
      "title" : "Slot title 103",
      "startDate" : "2015-10-12T00:00:00.000Z",
      "createdAt" : "2015-10-04T20:11:46.310Z",
      "updatedAt" : "2015-10-04T20:11:46.310Z",
      "deletedAt" : null,
      "endDate" : "2019-10-23T07:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 417,
        "username" : "User 379",
        "createdAt" : "2015-10-04T20:11:46.306Z",
        "updatedAt" : "2015-10-04T20:11:46.306Z",
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
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/118"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=pAsfCcVmuqwHqhjjRZKGRRIZ_BU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/416/slots?after=MTE4JTIwMTUtMTAtMTIgMDA6MDA6MDAuMDAwMDAwMDAwJTIwMTktMTAtMjMgMDc6NDQ6MDIuMDAwMDAwMDAw</pre>

#### Query Parameters

<pre>after: MTE4JTIwMTUtMTAtMTIgMDA6MDA6MDAuMDAwMDAwMDAwJTIwMTktMTAtMjMgMDc6NDQ6MDIuMDAwMDAwMDAw</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/416/slots?after=MTE4JTIwMTUtMTAtMTIgMDA6MDA6MDAuMDAwMDAwMDAwJTIwMTktMTAtMjMgMDc6NDQ6MDIuMDAwMDAwMDAw&quot; -X GET \
	-H &quot;Authorization: Token token=pAsfCcVmuqwHqhjjRZKGRRIZ_BU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2ddd4f062a981fe0afa1c4b3046dc88e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 37d9f8eb-7331-4d81-85c7-cb2dafd21285
X-Runtime: 0.052904
Vary: Origin
Content-Length: 1385</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "status" : null,
    "moment" : null,
    "before" : "MTI0JTIwMTktMDktMDIgMTM6NDQ6MDIuMDAwMDAwMDAwJTIwMTktMTAtMDIgMTM6NDQ6MDIuMDAwMDAwMDAw",
    "after" : null
  },
  "data" : [
    {
      "id" : 124,
      "title" : "Slot title 109",
      "startDate" : "2019-09-02T13:44:02.000Z",
      "createdAt" : "2015-10-04T20:11:46.378Z",
      "updatedAt" : "2015-10-04T20:11:46.407Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T13:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 426,
        "username" : "User 388",
        "createdAt" : "2015-10-04T20:11:46.384Z",
        "updatedAt" : "2015-10-04T20:11:46.384Z",
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
      "slotter" : {
        "id" : 416
      },
      "parent" : {
        "id" : 125
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/124"
    },
    {
      "id" : 121,
      "title" : "Slot title 106",
      "startDate" : "2019-09-26T10:44:02.000Z",
      "createdAt" : "2015-10-04T20:11:46.331Z",
      "updatedAt" : "2015-10-04T20:11:46.355Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T10:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 421,
        "username" : "User 383",
        "createdAt" : "2015-10-04T20:11:46.334Z",
        "updatedAt" : "2015-10-04T20:11:46.334Z",
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
      "slotter" : {
        "id" : 416
      },
      "parent" : {
        "id" : 122
      },
      "visibility" : "public",
      "likes" : 0,
      "commentsCounter" : 0,
      "shareUrl" : null,
      "url" : "http://example.org/v1/slots/121"
    }
  ]
}
```
