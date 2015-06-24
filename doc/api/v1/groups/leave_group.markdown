# Groups API

## Leave group

### DELETE /v1/groups/:group_id/members

returns 200 if membership successfully invalidated

returns 401 if current user not active group member

returns 401 if current user has no membership for this group at all

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Authorization: Token token=zxVAUa53i8xagA-1WTh3C38L0qg
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/26/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/26/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=zxVAUa53i8xagA-1WTh3C38L0qg&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: e7e7fea0-e6c7-403e-a221-0da916ab8d6a
X-Runtime: 0.012347
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

