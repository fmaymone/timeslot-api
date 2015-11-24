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

<pre>Authorization: Token token=S8xCyeH_8yQBmE022tteo2b4fFA
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/21/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/21/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=S8xCyeH_8yQBmE022tteo2b4fFA&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: bb306cc3-e0e1-41d5-80d5-0b4c248ff0cd
X-Runtime: 0.008762
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

