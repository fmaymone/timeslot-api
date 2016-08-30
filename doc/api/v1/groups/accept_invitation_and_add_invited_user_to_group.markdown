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
Authorization: Token token=dn6qelJR8n578J1tzGZUIcXuw9k
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/d092d2c1-8209-4ae9-bf47-8f40c8bafeca/accept</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/d092d2c1-8209-4ae9-bf47-8f40c8bafeca/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=dn6qelJR8n578J1tzGZUIcXuw9k&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 80a02012-ad87-4d8d-adfe-d59913e004c9
X-Runtime: 0.072130
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

