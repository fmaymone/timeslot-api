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

<pre>Authorization: Token token=PNuEtRx7D56SyqUMHFL2rPO7td0
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/25b6acb3-02bd-486f-8983-17db7f5b2dfc/members/86</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/25b6acb3-02bd-486f-8983-17db7f5b2dfc/members/86&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=PNuEtRx7D56SyqUMHFL2rPO7td0&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 65642926-abf5-4f07-82d7-0af8eafde947
X-Runtime: 0.008997
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

