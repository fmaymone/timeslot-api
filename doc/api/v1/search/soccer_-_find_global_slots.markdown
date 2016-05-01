# Search API

## Soccer - Find global slots

### GET /v1/globalslots/search

Forwards a search request to the Elastic Search Service for global slots from the data team.

returns 422 if parameters invalid

### Parameters

Name : category *- required -*
Description : Basic slot category to search in. Valid categories are eg.: [cinema, soccer, concerts, clubbing, television]

Name : q *- required -*
Description : String to search global slots for

Name : moment
Description : find results after this datetime, default: Time.now

Name : limit
Description : maximum number of results, default: 20

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=_siacmTVwcx16JUhd4tzpNjb8NU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=soccer&amp;q=Borussia&amp;moment=2016-04-05&amp;limit=5</pre>

#### Query Parameters

<pre>category: soccer
q: Borussia
moment: 2016-04-05
limit: 5</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/search?category=soccer&amp;q=Borussia&amp;moment=2016-04-05&amp;limit=5&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=_siacmTVwcx16JUhd4tzpNjb8NU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5b987f4fb95ab32052bbdc37ca971b04&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3828bb22-d04c-4c52-be5a-e518d8edc078
X-Runtime: 0.013524
Content-Length: 5664</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
