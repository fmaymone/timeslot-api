# Me API

## Sign-out User

### GET /v1/me/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Authorization: Token token=Bf5O5bWKSZWxOFcxcZvMMSTp_S0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/signout</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/signout&quot; -X GET \
	-H &quot;Authorization: Token token=Bf5O5bWKSZWxOFcxcZvMMSTp_S0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: de71df17-0767-4e5c-9ebb-2cbf817f8340
X-Runtime: 0.010750
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

