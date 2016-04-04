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
Authorization: Token token=iv-Fpv3ldiiYNYjrK0ZRZHKn1ts
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/35d5ddc7-ce9f-4778-95cc-b59accdd41f4/refuse</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/35d5ddc7-ce9f-4778-95cc-b59accdd41f4/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=iv-Fpv3ldiiYNYjrK0ZRZHKn1ts&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Cache-Control: no-cache
X-Request-Id: 094f04ce-ec0b-4748-a49e-e933e1c5a1ab
X-Runtime: 0.013291
Vary: Origin
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

