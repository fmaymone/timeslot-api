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

<pre>Authorization: Token token=qpCaGbhrVd_LcJEBwDTrO47gMM8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/slots?limit=3&amp;moment=2018-03-19T15%3A47%3A11.954Z&amp;mode=upcoming</pre>

#### Query Parameters

<pre>limit: 3
moment: 2018-03-19T15:47:11.954Z
mode: upcoming</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/slots?limit=3&amp;moment=2018-03-19T15%3A47%3A11.954Z&amp;mode=upcoming&quot; -X GET \
	-H &quot;Authorization: Token token=qpCaGbhrVd_LcJEBwDTrO47gMM8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2baaa395c9419b5666c2d93c1bd52e88&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cbedeb0e-20ab-4372-b48c-9694a1a75097
X-Runtime: 0.097320
Content-Length: 3969</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
### Request

#### Headers

<pre>Authorization: Token token=qpCaGbhrVd_LcJEBwDTrO47gMM8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/19/slots</pre>

#### Query Parameters

<pre>after: NiUyMDE4LTAzLTI2IDAwOjAwOjAwLjAwMDAwMDAwMCUyMDE5LTEwLTE2IDAzOjQ0OjAyLjAwMDAwMDAwMA==</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/19/slots&quot; -X GET \
	-H &quot;Authorization: Token token=qpCaGbhrVd_LcJEBwDTrO47gMM8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;ec5f869a1a725449cd7ee8f82d086407&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a12efb41-3b83-4626-a8fd-cd7a653e365a
X-Runtime: 0.044195
Content-Length: 225</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
