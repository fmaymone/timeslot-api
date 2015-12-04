# Groups API

## Leave group

### DELETE /v1/groups/:group_id/members

returns 200 if membership successfully invalidated

returns 403 if current user not active group member

returns 403 if current user has no membership for this group at all

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Authorization: Token token=pkJykyNtd_MUAchur-tLDjflLYw
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/21/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/21/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=pkJykyNtd_MUAchur-tLDjflLYw&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 6c768849-e84d-4981-83c3-1fdb68e07a59
X-Runtime: 0.012065
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

