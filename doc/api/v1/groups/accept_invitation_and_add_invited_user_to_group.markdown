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
Authorization: Token token=gy1KlcN14g_t6_R0Nnrzc6LWuz8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/6dc7beb3-d190-432b-9391-914ea1d0d04a/accept</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/6dc7beb3-d190-432b-9391-914ea1d0d04a/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=gy1KlcN14g_t6_R0Nnrzc6LWuz8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 28b17986-d5c8-4151-b52a-2429780b071a
X-Runtime: 0.132274
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

