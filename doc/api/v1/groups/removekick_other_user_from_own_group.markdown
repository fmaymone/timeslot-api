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

<pre>Authorization: Token token=nEk4QPKBIv5-DbPbQhLUxFvBTzQ
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/46ba14db-9870-4b93-9a09-346c5bb57bfe/members/407</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/46ba14db-9870-4b93-9a09-346c5bb57bfe/members/407&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=nEk4QPKBIv5-DbPbQhLUxFvBTzQ&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 589bc307-622a-4bd4-b183-3d475a095c8f
X-Runtime: 0.123288
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

