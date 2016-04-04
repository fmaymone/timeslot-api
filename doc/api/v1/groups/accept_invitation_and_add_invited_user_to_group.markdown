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
Authorization: Token token=PUvhOsl-HYD2vqCPpbd175S2PW0
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/7f247549-1f93-4c63-b38e-52695e65417c/accept</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/7f247549-1f93-4c63-b38e-52695e65417c/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=PUvhOsl-HYD2vqCPpbd175S2PW0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 746af3df-61d6-4963-b1d6-d142c113ae51
X-Runtime: 0.008945
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

