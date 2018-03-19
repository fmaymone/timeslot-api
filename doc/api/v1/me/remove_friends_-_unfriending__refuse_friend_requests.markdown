# Me API

## Remove Friends - Unfriending / Refuse Friend Requests

### POST /v1/me/remove_friends

Receives a list of User IDs for which a friendship with the current user will be refused or deleted.

returns 404 if an User ID is invalid

### Parameters

Name : ids *- required -*
Description : Array of User IDs for whom to refuse/destroy a friendship

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=3x2Vl4qlAqd50qPqVND3aueqIzI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/me/remove_friends</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/me/remove_friends&quot; -d &#39;{&quot;ids&quot;:[106,107,108,105]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=3x2Vl4qlAqd50qPqVND3aueqIzI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: bc3b0836-d9ca-4e0a-815e-c7996a6e29f7
X-Runtime: 0.198903
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

