# Me API

## Get slot library - with pagination

### GET /v1/me/library

Returns all Slots the current user has created, was or is tagged to and all slots from  calendars the current users has subscribed to.

Also slots which the current user had once in his schedule but removed them are included.

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

<pre>Authorization: Token token=wEMl-wqaWgX4AK6ZqpW9J6toWok
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/library?limit=3&amp;moment=2016-12-11T19%3A48%3A27.420Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2016-12-11T19:48:27.420Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/library?limit=3&amp;moment=2016-12-11T19%3A48%3A27.420Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=wEMl-wqaWgX4AK6ZqpW9J6toWok&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e33e0646ee2efa4a3c305f297f9b6359&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 24e826c7-7c9f-416b-a02d-346bb03f8f8b
X-Runtime: 0.054516
Content-Length: 2268</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "paging" : {
    "limit" : 3,
    "mode" : "upcoming",
    "moment" : "2016-12-11T19:48:27.420Z",
    "filter" : null,
    "earliest" : null,
    "latest" : null,
    "before" : "MjUlMjAxNi0xMi0xMiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wMSAwMzo0NDowMi4wMDAwMDAwMDA=",
    "after" : "MjMlMjAxNi0xMi0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yNiAwMTo0NDowMi4wMDAwMDAwMDA=",
    "poolSize" : 3
  },
  "data" : [
    {
      "id" : 25,
      "title" : "Slot title 27",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:48:27.416Z",
      "updatedAt" : "2016-12-11T19:48:27.416Z",
      "deletedAt" : null,
      "endDate" : "2019-10-01T03:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 52,
        "username" : "User 50",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:27.384Z",
        "updatedAt" : "2016-12-11T19:48:27.384Z",
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
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/25"
    },
    {
      "id" : 24,
      "title" : "Slot title 26",
      "description" : "",
      "startDate" : "2016-12-12T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:48:27.406Z",
      "updatedAt" : "2016-12-11T19:48:27.406Z",
      "deletedAt" : null,
      "endDate" : "2019-10-27T02:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 52,
        "username" : "User 50",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:27.384Z",
        "updatedAt" : "2016-12-11T19:48:27.384Z",
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
      "url" : "http://example.org/v1/slots/24"
    },
    {
      "id" : 23,
      "title" : "Slot title 25",
      "description" : "",
      "startDate" : "2016-12-19T00:00:00.000Z",
      "rrule" : "",
      "createdAt" : "2016-12-11T19:48:27.396Z",
      "updatedAt" : "2016-12-11T19:48:27.396Z",
      "deletedAt" : null,
      "endDate" : "2019-10-26T01:44:02.000Z",
      "location" : null,
      "creator" : {
        "id" : 52,
        "username" : "User 50",
        "firstName" : null,
        "middleName" : null,
        "lastName" : null,
        "createdAt" : "2016-12-11T19:48:27.384Z",
        "updatedAt" : "2016-12-11T19:48:27.384Z",
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
      "firstGroup" : null,
      "slotGroupUuids" : [],
      "url" : "http://example.org/v1/slots/23"
    }
  ]
}
```
### Request

#### Headers

<pre>Authorization: Token token=wEMl-wqaWgX4AK6ZqpW9J6toWok
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/52/slots</pre>

#### Query Parameters

<pre>after: MjMlMjAxNi0xMi0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yNiAwMTo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/52/slots&quot; -X GET \
	-H &quot;Authorization: Token token=wEMl-wqaWgX4AK6ZqpW9J6toWok&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;07620864b3b6aee499e614943fe01c2e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 416e8aa8-475c-430a-a2ca-a8ab46f4ddec
X-Runtime: 0.013867
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
    "before" : "MjMlMjAxNi0xMi0xOSAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0yNiAwMTo0NDowMi4wMDAwMDAwMDA=",
    "after" : null,
    "poolSize" : 3
  },
  "data" : []
}
```
