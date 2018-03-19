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
Authorization: Token token=Gcmb61RMx41gGVod9h0iIFLATLA
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/7ed8987f-99e8-41f4-99c3-96c832b4801d/refuse</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/7ed8987f-99e8-41f4-99c3-96c832b4801d/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Gcmb61RMx41gGVod9h0iIFLATLA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: b771e70b-ff7d-4d75-a250-f0313e7a2276
X-Runtime: 0.017452
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

