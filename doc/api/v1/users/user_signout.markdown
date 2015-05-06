# Users API

## User signout

### GET /v1/users/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=4aoFtFlM8hFoBq0UpWkHZs7vkLA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/signout</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users/signout&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=4aoFtFlM8hFoBq0UpWkHZs7vkLA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 30207422-4cf1-4862-917b-00c4aa99b108
X-Runtime: 0.005418
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre> </pre>
