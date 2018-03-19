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

<pre>Authorization: Token token=NYZzmVQDDITRfi5HIJB5qnf8faI
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/188/friends</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/users/188/friends&quot; -X GET \
	-H &quot;Authorization: Token token=NYZzmVQDDITRfi5HIJB5qnf8faI&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1be44af0b7097b1214a5e4517e224047&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8e64990a-48f6-480f-9452-236d30212310
X-Runtime: 0.030522
Content-Length: 875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
