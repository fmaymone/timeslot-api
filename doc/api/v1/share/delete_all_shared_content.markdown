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
Authorization: Token token=ReOFnl8n-ECbrZy4Fb74u-M0X_4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/share/30</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/30&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ReOFnl8n-ECbrZy4Fb74u-M0X_4&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 4300ea1e-f003-46e5-a3b7-f91f9db9a59a
X-Runtime: 0.006899
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

