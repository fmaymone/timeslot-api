# Users API

## Get slots for Friend - with &#39;between&#39; pagination

### GET /v1/users/:id/slots

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

<pre>Authorization: Token token=8faz-xc_OwKHBtWcB0Kg5awmdwI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/142/slots?limit=2&amp;filter=between&amp;earliest=2016-04-21T09%3A06%3A18.000Z&amp;latest=2016-04-21T19%3A06%3A18.000Z</pre>

#### Query Parameters

<pre>limit: 2
filter: between
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/142/slots?limit=2&amp;filter=between&amp;earliest=2016-04-21T09%3A06%3A18.000Z&amp;latest=2016-04-21T19%3A06%3A18.000Z&quot; -X GET \
	-H &quot;Authorization: Token token=8faz-xc_OwKHBtWcB0Kg5awmdwI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9bf78da41b89ede6295cb493e5c963f0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 49ceeb2c-5b2b-477e-9d56-4e35d05e71d8
X-Runtime: 0.110195
Content-Length: 1619</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
### Request

#### Headers

<pre>Authorization: Token token=8faz-xc_OwKHBtWcB0Kg5awmdwI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/142/slots</pre>

#### Query Parameters

<pre>after: NTUlMjAxNi0wNC0yMSAwNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMjowNjoxOC4wMDAwMDAwMDA=
filter: between
limit: 2
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/142/slots&quot; -X GET \
	-H &quot;Authorization: Token token=8faz-xc_OwKHBtWcB0Kg5awmdwI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9ec207393faea0a65fc79436e3ad27dd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a057d400-41f2-4724-bb30-0b2df0f4bd9a
X-Runtime: 0.085143
Content-Length: 1697</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
### Request

#### Headers

<pre>Authorization: Token token=8faz-xc_OwKHBtWcB0Kg5awmdwI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/142/slots</pre>

#### Query Parameters

<pre>after: NTQlMjAxNi0wNC0yMSAxNTowNjoxOC4wMDAwMDAwMDAlMjAxNi0wNC0yMSAyMzowNjoxOC4wMDAwMDAwMDA=
filter: between
limit: 2
earliest: 2016-04-21T09:06:18.000Z
latest: 2016-04-21T19:06:18.000Z</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/142/slots&quot; -X GET \
	-H &quot;Authorization: Token token=8faz-xc_OwKHBtWcB0Kg5awmdwI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;dccacb93f8e6a4e3434cc2e56fe37083&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fa5d9aab-983f-4f90-bd62-064d327bd550
X-Runtime: 0.071473
Content-Length: 958</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
