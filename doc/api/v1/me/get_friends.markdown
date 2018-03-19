# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=zMD1dXA5YT0a8mDBRuQ-KBDZI7c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=zMD1dXA5YT0a8mDBRuQ-KBDZI7c&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8b6e38731d8947659263d79bd37b3fba&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2fa0d285-ca81-40cc-8f23-7c572841484c
X-Runtime: 0.026158
Content-Length: 649</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
