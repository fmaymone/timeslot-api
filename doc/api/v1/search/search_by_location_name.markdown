# Search API

## Search by location name

### GET /v1/search/location

returns 404 if query is invalid



### Parameters

Name : query *- required -*
Description : The query of the search


### Response Fields

Name : id
Description : ID of the location

Name : name
Description : name of the location

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=MtEevE5refLUsPEaT8RjoBwSMWc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/location?query=timeslot+berlin</pre>

#### Query Parameters

<pre>query: timeslot berlin</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/location?query=timeslot+berlin&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=MtEevE5refLUsPEaT8RjoBwSMWc&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9a991a1272c7f96ad0f28f2f3c8c1099&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 38b08547-d14d-488f-bbf1-0f90f92f5e79
X-Runtime: 0.015495
Content-Length: 391</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
