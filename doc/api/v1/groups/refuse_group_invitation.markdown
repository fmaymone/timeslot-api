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
Authorization: Token token=Nybvx--s_zEp6Mmo8aA6I3Ltxuk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/18/refuse</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/18/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Nybvx--s_zEp6Mmo8aA6I3Ltxuk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: c881ba2a-15f3-441e-9d76-aba62c642e62
X-Runtime: 0.006865
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

