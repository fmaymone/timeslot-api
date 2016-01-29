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
Authorization: Token token=qmeFc3AIa2UJkGi7Ds07cgywg6I
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/fe02f1c9-8c9f-48c1-9b60-4d9d83bd9e07/refuse</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/fe02f1c9-8c9f-48c1-9b60-4d9d83bd9e07/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=qmeFc3AIa2UJkGi7Ds07cgywg6I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: a3fa6ac2-cc79-4d34-ad51-7b3ef744209a
X-Runtime: 0.031465
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

