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
Authorization: Token token=b6LHsSUov3RK1zwmheVx7QC7fcM
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/6dd0f3ec-3236-4fee-8584-3716284a6f4d/accept</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/6dd0f3ec-3236-4fee-8584-3716284a6f4d/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=b6LHsSUov3RK1zwmheVx7QC7fcM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: e8909138-41dd-4fd6-8bf6-9f76088d310c
X-Runtime: 0.089761
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

