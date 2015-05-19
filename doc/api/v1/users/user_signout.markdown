# Users API

## User signout

### GET /v1/users/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=oZHKu--S2uUpppDSlRjzXEGCA0Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/signout</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/signout&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=oZHKu--S2uUpppDSlRjzXEGCA0Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 6469a076-3213-4fd1-a0af-0be59cdd4dab
X-Runtime: 0.006578
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

