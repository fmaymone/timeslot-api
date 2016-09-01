# Me API

## Sign-out User

### GET /v1/me/signout

returns OK if current user was successfully signed out

returns 403 if there was no current user
### Request

#### Headers

<pre>Authorization: Token token=aNo-uChXX6N18KoqcCzcRxRw2mw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/signout</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/signout&quot; -X GET \
	-H &quot;Authorization: Token token=aNo-uChXX6N18KoqcCzcRxRw2mw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 0109a1d3-8773-4648-a03f-eb86f5caff0f
X-Runtime: 0.005661
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

