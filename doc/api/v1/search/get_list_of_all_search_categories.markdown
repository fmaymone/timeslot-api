# Search API

## Get list of all search categories

### GET /v1/search/categories

Returns a list of all valid values for the &#39;category&#39; parameter for searching.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=dNVg7hXcFbMP0OSIBnwCuL_nLUI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/categories</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/categories&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=dNVg7hXcFbMP0OSIBnwCuL_nLUI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6f842869d69634c3e63398e8b7247495&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c80beed4-70c3-4609-978d-fd85779762e6
X-Runtime: 0.020054
Vary: Origin
Content-Length: 91</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "categories" : [
    "television",
    "cinema",
    "football",
    "calendars",
    "clubbing",
    "slots",
    "concerts"
  ]
}
```
