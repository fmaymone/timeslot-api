# Search API

## Cinema - Find global slots

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
Authorization: Token token=zUWliDMCZNjMyPIPLA52IY_Szq4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/globalslots/search?category=cinema&amp;q=Man&amp;moment=2016-04-29T12%3A43%3A28.907Z&amp;limit=7</pre>

#### Query Parameters

<pre>category: cinema
q: Man
moment: 2016-04-29T12:43:28.907Z
limit: 7</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/globalslots/search?category=cinema&amp;q=Man&amp;moment=2016-04-29T12%3A43%3A28.907Z&amp;limit=7&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=zUWliDMCZNjMyPIPLA52IY_Szq4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8f769a9ce6059cfde3aff0ac54730365&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 39224676-7f96-4591-8a31-f053030b8beb
X-Runtime: 0.014937
Content-Length: 22779</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[binary data]
```
