# Me API

## Get media items

### GET /v1/me/media

Returns an array which includes all media items of the current user.

### Response Fields

Name : array
Description : containing media items as a list of MediaItem

### Request

#### Headers

<pre>Authorization: Token token=3P1ZseRGA7dmT3KtL3sBVl-opf8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/media</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/media&quot; -X GET \
	-H &quot;Authorization: Token token=3P1ZseRGA7dmT3KtL3sBVl-opf8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4750ee204d851edc393ebe16d7e2b193&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 347124c1-5650-47e2-ba16-35d3b620ccc7
X-Runtime: 0.026947
Content-Length: 1866</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
