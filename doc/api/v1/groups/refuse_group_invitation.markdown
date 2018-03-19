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
Authorization: Token token=W0OdRB7h8k2cKLsElgAIS4HG7dg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/a3753eeb-4fe3-45b3-95b1-57e81ef80ed7/refuse</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/a3753eeb-4fe3-45b3-95b1-57e81ef80ed7/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=W0OdRB7h8k2cKLsElgAIS4HG7dg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: d4194799-9a49-4512-903f-3cc07824b5ca
X-Runtime: 0.010659
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

