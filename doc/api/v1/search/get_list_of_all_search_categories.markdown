# Search API

## Get list of all search categories

### GET /v1/search/categories

Returns a list of all valid values for the &#39;category&#39; parameter for searching.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=3KP0BLgGWFwt_cxTIHlprIBXhHU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/categories</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/categories&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=3KP0BLgGWFwt_cxTIHlprIBXhHU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;95fbd3742904e074c9553f636b73e312&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a1044320-f687-4263-8189-3ee796af22a4
X-Runtime: 0.024868
Content-Length: 109</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "categories" : [
    "all",
    "art",
    "users",
    "cinema",
    "calendars",
    "television",
    "clubbing",
    "slots",
    "soccer",
    "concerts"
  ]
}
```
