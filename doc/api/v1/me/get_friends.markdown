# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=QMGTEixDaw0tetb3CxJR3_LoT7k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=QMGTEixDaw0tetb3CxJR3_LoT7k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;561f043e6b6f423d0c3054543d28e721&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 59b74f3c-b5a1-44a2-80dc-e077ac7ebccd
X-Runtime: 0.032488
Content-Length: 649</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
