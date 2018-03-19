# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=KK9fIjpM8aQz2TLUZfar4j4no3M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=KK9fIjpM8aQz2TLUZfar4j4no3M&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8774b1df20e04630da179041bea5fb1f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4f63704a-0c97-47f8-b402-467875c81a0c
X-Runtime: 0.039792
Content-Length: 649</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
