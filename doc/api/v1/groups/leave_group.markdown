# Groups API

## Leave group

### DELETE /v1/groups/:group_uuid/members

returns 200 if membership successfully invalidated

returns 403 if current user not active group member

returns 403 if current user has no membership for this group at all

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Authorization: Token token=bhWKoBYQEp6It6_cdW3G5ZADoJs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/da35baea-39f2-4693-abe0-fbf5e981ca49/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/da35baea-39f2-4693-abe0-fbf5e981ca49/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=bhWKoBYQEp6It6_cdW3G5ZADoJs&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 213c6e67-af50-4826-92f1-97b8ef3bcdf9
X-Runtime: 0.043817
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

