# Groups API

## Refuse group invitation

### POST /v1/groups/:group_uuid/refuse

The invitation is invalidated.

returns 200 if invite successfully refused.

returns 403 if invitation is missing

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=jvPDL8rh1qYgi6_0thX775iecvM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/e065e009-97ee-46a8-9936-a1271054ef57/refuse</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/e065e009-97ee-46a8-9936-a1271054ef57/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=jvPDL8rh1qYgi6_0thX775iecvM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 6648aca6-2216-48d3-b736-4a42aa188475
X-Runtime: 0.011879
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

