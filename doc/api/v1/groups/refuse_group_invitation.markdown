# Groups API

## Refuse group invitation

### POST /v1/groups/:group_id/refuse

The invitation is invalidated.

returns 200 if invite successfully refused.

returns 403 if invitation is missing

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=o5lxBWH4arFgCM_uLPkhKBcx8sI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/24/refuse</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/24/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=o5lxBWH4arFgCM_uLPkhKBcx8sI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 8168b0c3-5bba-47c9-badc-68250fb5ed83
X-Runtime: 0.009294
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

