# Me API

## Get suggested Users

### GET /v1/me/suggested_users

Returns an array which includes Kaweh if User has no friends whatsoever. If User has one or more friends returns the friends-of-the-friends (&#39;foafs&#39; :).

### Response Fields

Name : array
Description : contains potentially interesting users

### Request

#### Headers

<pre>Authorization: Token token=h2of5Iton0KF1Uvgp3vJcmh41Ag
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/suggested_users</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/me/suggested_users&quot; -X GET \
	-H &quot;Authorization: Token token=h2of5Iton0KF1Uvgp3vJcmh41Ag&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b44871d5b26f9367c9e804a3809d8e4b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 37995b16-ffa1-4441-8088-b93b6fbb0f5e
X-Runtime: 0.050572
Content-Length: 873</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
