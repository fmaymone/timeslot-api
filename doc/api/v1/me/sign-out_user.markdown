# Me API

## Sign-out User

### GET /v1/me/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Authorization: Token token=pNZVqs_WYTrKlAPObMaVnS-VuMI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/signout</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/signout&quot; -X GET \
	-H &quot;Authorization: Token token=pNZVqs_WYTrKlAPObMaVnS-VuMI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 438cbae4-042e-4e9f-910f-fc05b2daada3
X-Runtime: 0.012208
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

