# Groups API

## Remove/Kick other user from own group

### DELETE /v1/groups/:group_uuid/members/:user_id

returns 200 if user successfully removed from group

returns 200 if invite for user successfully invalidated

returns 422 if user to be kicked has no membership for this group at all

returns 403 if current user not group owner aka not allowed to kick members

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

Name : user_id *- required -*
Description : ID of the user to kick

### Request

#### Headers

<pre>Authorization: Token token=dmIzuNQt9dy9YtQCcAN7ltG503g
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/02e9ee71-6459-4896-a83b-86775fe0fc43/members/71</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/02e9ee71-6459-4896-a83b-86775fe0fc43/members/71&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=dmIzuNQt9dy9YtQCcAN7ltG503g&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: c85a19be-ee5d-4d95-83db-0c22cf61a2b9
X-Runtime: 0.070745
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

