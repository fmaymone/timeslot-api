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
Authorization: Token token=PAke68Q56Pdmu3LoD8J2skYEUTQ
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/50a715a6-62c9-4d9c-bcb4-8f8c36d27704/accept</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/50a715a6-62c9-4d9c-bcb4-8f8c36d27704/accept&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=PAke68Q56Pdmu3LoD8J2skYEUTQ&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 7e6009c8-9363-43f8-97fc-2223cebfb5ee
X-Runtime: 0.072997
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

