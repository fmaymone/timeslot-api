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
Authorization: Token token=Z2SRzgaNmxTVhJCSHDWAkcZX8vU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/share/35</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/share/35&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Z2SRzgaNmxTVhJCSHDWAkcZX8vU&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 132848ad-c0d1-42af-bdc6-d9bc3c743bcd
X-Runtime: 0.008679
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

