# Share API

## Delete all shared content

### DELETE /v1/share/:id

returns 404 if slot was not found

returns 422 if slot could not be unshared



### Parameters

Name : id *- required -*
Description : The id of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=BVjNwUPyk8yG5-t5pD9Yp19XXRc
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/share/35</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=BVjNwUPyk8yG5-t5pD9Yp19XXRc&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 92556d30-a43b-49ac-9781-75e29d582f2c
X-Runtime: 0.007640
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

