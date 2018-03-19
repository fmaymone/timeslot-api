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

<pre>Authorization: Token token=vf0q2jfGx_ohWuToTDusEdBHmfg
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/a62aa2c1-5e7a-4c47-bed7-418b1ac062dd/members/407</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/a62aa2c1-5e7a-4c47-bed7-418b1ac062dd/members/407&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=vf0q2jfGx_ohWuToTDusEdBHmfg&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: dc2d697c-a7df-4a34-87e8-b2ffe5e9bf8f
X-Runtime: 0.086733
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

