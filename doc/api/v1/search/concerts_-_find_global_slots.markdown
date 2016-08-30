# Search API

## Concerts - Find global slots

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
Authorization: Token token=a9Ro5UEqXm3N_J7Vmhyg9xndjSA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=concerts&amp;q=proje&amp;moment=2016-04-05&amp;limit=5</pre>

#### Query Parameters

<pre>category: concerts
q: proje
moment: 2016-04-05
limit: 5</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/search?category=concerts&amp;q=proje&amp;moment=2016-04-05&amp;limit=5&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=a9Ro5UEqXm3N_J7Vmhyg9xndjSA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;e5a5ccbd505aea9a8c5644ca39768ff3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c9f880d6-134d-449f-92ca-4e7192f496e7
X-Runtime: 0.009661
Content-Length: 6570</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
