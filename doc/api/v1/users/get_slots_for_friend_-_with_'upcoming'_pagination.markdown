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

<pre>Authorization: Token token=_hkHWNOzUeRuKAuDOZZ8yFkXUMs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/150/slots?limit=3&amp;moment=2018-03-19T15%3A47%3A34.424Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2018-03-19T15:47:34.424Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/150/slots?limit=3&amp;moment=2018-03-19T15%3A47%3A34.424Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=_hkHWNOzUeRuKAuDOZZ8yFkXUMs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;829867273f1f69c97c6f77b51b1a3b05&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bd882165-9ac4-4bdf-a503-82725478a0f6
X-Runtime: 0.074989
Content-Length: 2321</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
### Request

#### Headers

<pre>Authorization: Token token=_hkHWNOzUeRuKAuDOZZ8yFkXUMs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/150/slots</pre>

#### Query Parameters

<pre>after: NjElMjAxOC0wMy0yNiAwMDowMDowMC4wMDAwMDAwMDAlMjAxOS0xMC0wOSAwODo0NDowMi4wMDAwMDAwMDA=</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/150/slots&quot; -X GET \
	-H &quot;Authorization: Token token=_hkHWNOzUeRuKAuDOZZ8yFkXUMs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d021aa94bb8f72d05d6bef8dd33b28cc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1bbc29aa-165a-4e0c-bf5d-1aef14e895c8
X-Runtime: 0.035998
Content-Length: 225</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
