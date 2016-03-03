# Search API

## Get list of all search categories

### GET /v1/search/categories

Returns a list of all valid values for the &#39;category&#39; parameter for searching.
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=1CwtWjKpoALrxfb01_Lzm6kU-J8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/search/categories</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/search/categories&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=1CwtWjKpoALrxfb01_Lzm6kU-J8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9e15bd52c71f83957a19b3f741918367&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f9a7e98a-14f3-462d-9ada-d665abdabe2f
X-Runtime: 0.020104
Vary: Origin
Content-Length: 47</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "categories" : [
    "football",
    "concerts",
    "cinema"
  ]
}
```
