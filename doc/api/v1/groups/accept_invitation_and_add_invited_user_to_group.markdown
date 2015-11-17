# Groups API

## Accept Invitation and add invited user to group

### POST /v1/groups/:group_id/accept

returns 200 if invite successfully accepted

returns 403 if invitation is missing

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=pApukod_rOnjWjlOUx0IBkJ0mrU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/18/accept</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/18/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=pApukod_rOnjWjlOUx0IBkJ0mrU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 87c19550-eaf6-4c3d-921b-d8572542b500
X-Runtime: 0.010758
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

