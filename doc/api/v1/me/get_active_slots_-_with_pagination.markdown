# Me API

## Get active slots - with pagination

### GET /v1/me/slots

Returns all Slots the current user is tagged to or which are in a calendar the current user is subscribed to.

Response contains &#39;*paging*&#39; hash &amp; &#39;*data*&#39; array.
If there are more than **limit** results, &#39;*paging*&#39; has **before** and **after** cursors which can be used for subsequent requests. The first request should always be made with **mode** &#39;*upcoming*&#39; to make sure no results are skipped.&#39;*data*&#39; contains an array which includes the slots.

The slots are ordered by startdate, enddate, id.

### Parameters

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

<pre>Authorization: Token token=AIrfcMrh5tfiG3oGvSMmzWDqzxQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2016-12-11T19%3A48%3A27.002Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-12-11T19:48:27.002Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/slots?limit=3&amp;moment=2016-12-11T19%3A48%3A27.002Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=AIrfcMrh5tfiG3oGvSMmzWDqzxQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d13161cc6ee7831351ffb6f6bf5a818b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a73902c0-7886-46da-bade-3f41c75bb851
X-Runtime: 0.171403
Content-Length: 3921</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-12-11T19:48:27.002Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "MTglMjAxNi0xMi0xMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMSAyMDo0NDowMi4wMDAwMDAwMDA=",
    "after" : "MTclMjAxNi0xMi0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMCAxOTo0NDowMi4wMDAwMDAwMDA=",
    "poolSize" : 3
  },
  "data" : [
    {
      "id" : 18,
      "title" : "Slot title 20",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:48:26.983Z",
      "updatedAt" : "2016-12-11T19:48:26.983Z",
      "deletedAt" : null,
      "endDate" : "2019-10-21T20:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 44,
        "username" : "User 42",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:26.939Z",
        "updatedAt" : "2016-12-11T19:48:26.939Z",
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
      "firstGroup" : {
        "id" : "6c27a892-aff9-4b20-92b4-b0b4a516c835",
        "name" : "Private",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-12-11T19:48:26.945Z",
        "updatedAt" : "2016-12-11T19:48:26.945Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 44,
          "username" : "User 42",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:48:26.939Z",
          "updatedAt" : "2016-12-11T19:48:26.939Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          44
        ],
        "memberCount" : 1,
        "slotCount" : 3
      },
      "slotGroupUuids" : [
        "6c27a892-aff9-4b20-92b4-b0b4a516c835"
      ],
      "url" : "http://example.org/v1/slots/18"
    },
    {
      "id" : 19,
      "title" : "Slot title 21",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:48:26.997Z",
      "updatedAt" : "2016-12-11T19:48:26.997Z",
      "deletedAt" : null,
      "endDate" : "2019-10-22T21:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 44,
        "username" : "User 42",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:26.939Z",
        "updatedAt" : "2016-12-11T19:48:26.939Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "private",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : {
        "id" : "6c27a892-aff9-4b20-92b4-b0b4a516c835",
        "name" : "Private",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-12-11T19:48:26.945Z",
        "updatedAt" : "2016-12-11T19:48:26.945Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 44,
          "username" : "User 42",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:48:26.939Z",
          "updatedAt" : "2016-12-11T19:48:26.939Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          44
        ],
        "memberCount" : 1,
        "slotCount" : 3
      },
      "slotGroupUuids" : [
        "6c27a892-aff9-4b20-92b4-b0b4a516c835"
      ],
      "url" : "http://example.org/v1/slots/19"
    },
    {
      "id" : 17,
      "title" : "Slot title 19",
      "description" : "",
      "startDate" : "2016-12-19T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:48:26.970Z",
      "updatedAt" : "2016-12-11T19:48:26.970Z",
      "deletedAt" : null,
      "endDate" : "2019-10-20T19:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 44,
        "username" : "User 42",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:26.939Z",
        "updatedAt" : "2016-12-11T19:48:26.939Z",
        "deletedAt" : null,
        "image" : ""
      },
      "notes" : [],
      "media" : [],
      "settings" : {
        "alerts" : "omitted"
      },
      "visibility" : "private",
      "likerIds" : [],
      "likes" : 0,
      "commentsCounter" : 0,
      "firstGroup" : {
        "id" : "6c27a892-aff9-4b20-92b4-b0b4a516c835",
        "name" : "Private",
        "image" : "",
        "description" : null,
        "defaultColor" : "000000",
        "membersCanPost" : false,
        "membersCanInvite" : false,
        "public" : false,
        "createdAt" : "2016-12-11T19:48:26.945Z",
        "updatedAt" : "2016-12-11T19:48:26.945Z",
        "deletedAt" : null,
        "owner" : {
          "id" : 44,
          "username" : "User 42",
          "firstName" : null,
          "middleName" : null,
          "lastName" : null,
          "createdAt" : "2016-12-11T19:48:26.939Z",
          "updatedAt" : "2016-12-11T19:48:26.939Z",
          "deletedAt" : null,
          "image" : ""
        },
        "memberIds" : [
          44
        ],
        "memberCount" : 1,
        "slotCount" : 3
      },
      "slotGroupUuids" : [
        "6c27a892-aff9-4b20-92b4-b0b4a516c835"
      ],
      "url" : "http://example.org/v1/slots/17"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=AIrfcMrh5tfiG3oGvSMmzWDqzxQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/44/slots</pre>

#### Query Parameters

<pre>after: MTclMjAxNi0xMi0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMCAxOTo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/44/slots&quot; -X GET \
	-H &quot;Authorization: Token token=AIrfcMrh5tfiG3oGvSMmzWDqzxQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5de2ff013faef573ba791a4244425220&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d1fbf029-88ff-4fbc-bcb6-4ea3438d3fa1
X-Runtime: 0.033770
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
    "before" : "MTclMjAxNi0xMi0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yMCAxOTo0NDowMi4wMDAwMDAwMDA=",
    "after" : null,
    "poolSize" : 6
  },
  "data" : []
}
```
