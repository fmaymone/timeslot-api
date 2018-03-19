# Me API

## Get suggested Users

### GET /v1/me/suggested_users

Returns an array which includes Kaweh if User has no friends whatsoever. If User has one or more friends returns the friends-of-the-friends (&#39;foafs&#39; :).

### Response Fields

Name : array
Description : contains potentially interesting users

### Request

#### Headers

<pre>Authorization: Token token=wLjBscCUXuSBzRxcpGU91zup1OM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/suggested_users</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/suggested_users&quot; -X GET \
	-H &quot;Authorization: Token token=wLjBscCUXuSBzRxcpGU91zup1OM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;69dfcf83c4a743fc738d42c802a97139&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bacf5986-cfae-4656-9d9e-fe211adcf91b
X-Runtime: 0.039926
Content-Length: 655</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
