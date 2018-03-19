# Users API

## Get list of friends of another user

### GET /v1/users/:id/friends

Other user must be friend with current user.

returns list of friends of other user

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the friends for.

### Request

#### Headers

<pre>Authorization: Token token=_lbBuYvBUYv-zTUuRR8VXEIbGBo
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/186/friends</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/users/186/friends&quot; -X GET \
	-H &quot;Authorization: Token token=_lbBuYvBUYv-zTUuRR8VXEIbGBo&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;123a948fe1f63649b2d4d5af58d6d6f2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 05031ecf-96c8-46b6-a9ae-e395a62dbd2a
X-Runtime: 0.026167
Content-Length: 875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
