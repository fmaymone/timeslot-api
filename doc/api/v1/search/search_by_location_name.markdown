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
Authorization: Token token=FSrYtzlaaBSy6rsO30YB0ewflgE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/location?query=timeslot+berlin</pre>

#### Query Parameters

<pre>query: timeslot berlin</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/search/location?query=timeslot+berlin&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=FSrYtzlaaBSy6rsO30YB0ewflgE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;74314fd40be7386fd806eda86c015f9e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5e38cdb6-b511-4deb-aa7f-dc4fd1191b9f
X-Runtime: 0.019417
Content-Length: 391</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
