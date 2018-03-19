# Me API

## Get suggested Users

### GET /v1/me/suggested_users

Returns an array which includes Kaweh if User has no friends whatsoever. If User has one or more friends returns the friends-of-the-friends (&#39;foafs&#39; :).

### Response Fields

Name : array
Description : contains potentially interesting users

### Request

#### Headers

<pre>Authorization: Token token=jeNMD_kX5tLrxfKgQLsLGT1S3RM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/suggested_users</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/suggested_users&quot; -X GET \
	-H &quot;Authorization: Token token=jeNMD_kX5tLrxfKgQLsLGT1S3RM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3915eed262238c7b205c1ec69a1d5b38&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d7156bf7-8aab-4e27-895c-8ff503b2482d
X-Runtime: 0.030253
Content-Length: 655</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
