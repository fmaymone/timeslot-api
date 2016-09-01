# Users API

## Get slots for Friend - with &#39;upcoming&#39; pagination

### GET /v1/users/:id/slots

Response contains &#39;*paging*&#39; hash &amp; &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **mode** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes StandardSlots.

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
Description : Query parameter to reduce the set of valid slots which are taken into account for the db query. Must be one of:
- **between**: takes 2 additional parameters: *earliest* and *latest*. Will only return slots which overlap with the specified time interval. *Rule: startDate &lt; latest AND endDate &gt; earliest*. Default **mode** is &#39;now&#39;, default **moment** == &#39;earliest.&#39;
- **newer**: tba
Default is **none**.

Name : mode
Description : Query parameter to request slots relative to a given **moment**. Must be one of:
- **past**: *start* before *moment*
- **upcoming**: *start* after or equal *moment*
- **ongoing**: *start* before &amp; *end* after *moment*
- **finished**: *start* &amp; *end* before *moment*
- **now**: *ongoing* &amp; *upcoming* slots
- **around**: limit/2 slots with *start* before *moment* and limit/2 slots with *start* after *moment*. This might miss ongoing slots.
- **all**: no restriction
Default is **all**.

Name : before
Description : Pagination cursor to retrieve slots which do happen BEFORE the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : after
Description : Pagination cursor to retrieve slots which do happen AFTER the slot represented by this cursor. If a cursor is send, **mode** and **moment** are ignored.

Name : earliest
Description : A point in time. No results before this moment will be returned. Only works with &#39;between&#39; filter.

Name : latest
Description : A point in time. No results after this moment will be returned. Only works with &#39;between&#39; filter.


### Response Fields

Name : paging
Description : Hash containing relevant paging parameters.

Name : limit
Description : Maximum number of slots returned.

Name : mode
Description : Types of slots which were requested.

Name : moment
Description : Point-in-time which was used for the query.

Name : filter
Description : Type of filter which was applied to initial data.

Name : earliest
Description : If set, no Slots which have ended before this point-in-time will be included in the result.

Name : latest
Description : If set, no Slots which are starting after this point-in-time will be included in the result.

Name : before
Description : Cursor that represents the first item in the response dataset.

Name : after
Description : Cursor that represents the last item in the response dataset.

Name : data
Description : Array containing the result dataset.

### Request

#### Headers

<pre>Authorization: Token token=STacmYmvZ9rHh11uiOspmQl-M6g
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/146/slots?limit=3&amp;moment=2016-08-30T09%3A51%3A11.987Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-08-30T09:51:11.987Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/146/slots?limit=3&amp;moment=2016-08-30T09%3A51%3A11.987Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=STacmYmvZ9rHh11uiOspmQl-M6g&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d99578ae3b8d774ee34837b7a7974a45&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f5b95ebf-0298-4b61-b61e-2144963939c4
X-Runtime: 0.052487
Content-Length: 2243</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-08-30T09:51:11.987Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "NjMlMjAxNi0wOC0zMSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wNCAwMzo0NDowMi4wMDAwMDAwMDA=",
    "after" : "NjIlMjAxNi0wOS0wNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wMyAwMjo0NDowMi4wMDAwMDAwMDA=",
    "poolSize" : 3
  },
  "data" : [
    {
      "id" : 63,
      "title" : "Slot title 219",
      "description" : "",
      "startDate" : "2016-08-31T00:00:00.000Z",
      "createdAt" : "2016-08-30T09:51:11.979Z",
      "updatedAt" : "2016-08-30T09:51:11.979Z",
      "deletedAt" : null,
      "endDate" : "2019-10-04T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 146,
        "username" : "User 874",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.930Z",
        "updatedAt" : "2016-08-30T09:51:11.930Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "public",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/63"
    },
    {
      "id" : 61,
      "title" : "Slot title 217",
      "description" : "",
      "startDate" : "2016-09-05T00:00:00.000Z",
      "createdAt" : "2016-08-30T09:51:11.959Z",
      "updatedAt" : "2016-08-30T09:51:11.959Z",
      "deletedAt" : null,
      "endDate" : "2019-10-02T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 146,
        "username" : "User 874",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.930Z",
        "updatedAt" : "2016-08-30T09:51:11.930Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "friends",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/61"
    },
    {
      "id" : 62,
      "title" : "Slot title 218",
      "description" : "",
      "startDate" : "2016-09-05T00:00:00.000Z",
      "createdAt" : "2016-08-30T09:51:11.968Z",
      "updatedAt" : "2016-08-30T09:51:11.968Z",
      "deletedAt" : null,
      "endDate" : "2019-10-03T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 146,
        "username" : "User 874",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-08-30T09:51:11.930Z",
        "updatedAt" : "2016-08-30T09:51:11.930Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "friends",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/62"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=STacmYmvZ9rHh11uiOspmQl-M6g
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/146/slots</pre>

#### Query Parameters

<pre>after: NjIlMjAxNi0wOS0wNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wMyAwMjo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/146/slots&quot; -X GET \
	-H &quot;Authorization: Token token=STacmYmvZ9rHh11uiOspmQl-M6g&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;555f9fd6fbf215ff957e76067d2f0a1b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3d1c10e5-e675-4c5d-b0ad-a67b8cc605bc
X-Runtime: 0.020749
Content-Length: 225</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 40,
    "mode" : null,
    "moment" : null,
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "NjIlMjAxNi0wOS0wNSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wMyAwMjo0NDowMi4wMDAwMDAwMDA=",
    "after" : null,
    "poolSize" : 3
  },
  "data" : []
}
```
