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
Authorization: Token token=sahPtoQRYz-_V3wvRGbf9BVoJ9Y
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/24/refuse</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/24/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=sahPtoQRYz-_V3wvRGbf9BVoJ9Y&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: d199df28-8c4a-4998-8472-96335684897d
X-Runtime: 0.007071
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

