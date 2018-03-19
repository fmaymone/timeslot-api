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

<pre>Authorization: Token token=6CX-PH-ui_p4PpE7qVCmdgk2ERY
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/84b3aab5-1558-496b-b601-50fdf3305623/members/407</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/84b3aab5-1558-496b-b601-50fdf3305623/members/407&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=6CX-PH-ui_p4PpE7qVCmdgk2ERY&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: f4ce0967-1439-484f-8aaf-3986034b05fa
X-Runtime: 0.111916
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

