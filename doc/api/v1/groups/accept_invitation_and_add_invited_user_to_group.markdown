# Groups API

## Accept Invitation and add invited user to group

### POST /v1/groups/:group_uuid/accept

returns 200 if invite successfully accepted

returns 403 if invitation is missing

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=RvoQVGpiqhFf5jtl2bhfE9ftzec
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/0caa2f7e-82f4-45bd-add8-6e96cb36bf18/accept</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/0caa2f7e-82f4-45bd-add8-6e96cb36bf18/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=RvoQVGpiqhFf5jtl2bhfE9ftzec&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: dd21d51c-734a-44f6-9984-1ec4a9412965
X-Runtime: 0.040105
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

