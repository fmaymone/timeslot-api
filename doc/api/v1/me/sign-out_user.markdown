# Me API

## Sign-out User

### GET /v1/me/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Authorization: Token token=XwPVNze4m3BzxfbreRN164usvRY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/signout</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/signout&quot; -X GET \
	-H &quot;Authorization: Token token=XwPVNze4m3BzxfbreRN164usvRY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 99abbafb-4ddd-4f69-8c95-7c558a3890b1
X-Runtime: 0.010552
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

