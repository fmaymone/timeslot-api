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
Authorization: Token token=7nbQPzr61-hJWUPYHBoJgjO5-qM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/location?query=timeslot+berlin</pre>

#### Query Parameters

<pre>query: timeslot berlin</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/search/location?query=timeslot+berlin&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=7nbQPzr61-hJWUPYHBoJgjO5-qM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;6cfaae5621d10cefac299a7b861b4997&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5f991f4f-15a3-4ed7-8669-dbfe22badeaa
X-Runtime: 0.020873
Content-Length: 391</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
