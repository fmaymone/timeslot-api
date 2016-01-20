# Share API

## Delete all shared contents

### DELETE /v1/share/:id

returns 404 if slot was not found

returns 422 if slot could not be unshared



### Parameters

Name : id *- required -*
Description : The id of the slot

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=nW-KdLecCSqblTfd6fkXEIG5X0g
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/share/31</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/share/31&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=nW-KdLecCSqblTfd6fkXEIG5X0g&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: a7502dec-c1e9-4ded-bf5e-03ad0872f8ab
X-Runtime: 0.026332
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

