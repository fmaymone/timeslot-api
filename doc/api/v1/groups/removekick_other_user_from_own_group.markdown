# Groups API

## Remove/Kick other user from own group

### DELETE /v1/groups/:group_id/members/:user_id

returns 200 if user successfully removed from group

returns 200 if invite for user successfully invalidated

returns 422 if user to be kicked has no membership for this group at all

returns 403 if current user not group owner aka not allowed to kick members

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

Name : user_id *- required -*
Description : ID of the user to kick

### Request

#### Headers

<pre>Authorization: Token token=DZ45uwRhLisoZ3EiP3b3e6SYoKo
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/29/members/137</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/29/members/137&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=DZ45uwRhLisoZ3EiP3b3e6SYoKo&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 35c371dc-aefb-4dbb-af42-d31d6a353255
X-Runtime: 0.014752
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

