# Users API

## User signout

### GET /v1/users/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=-5CEkDaRP_X7oZCuB42m-bzsAiY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/signout</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/signout&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=-5CEkDaRP_X7oZCuB42m-bzsAiY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: d25bae4d-10f5-4c2a-8684-39d80379df94
X-Runtime: 0.012410
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

