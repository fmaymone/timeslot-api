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
Authorization: Token token=dKv5LWEID5H_mSA5Nyb9kVQh5no
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/d80c4e71-08ec-4deb-aa68-db789b0edfc8/refuse</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/d80c4e71-08ec-4deb-aa68-db789b0edfc8/refuse&quot; -d &#39;&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=dKv5LWEID5H_mSA5Nyb9kVQh5no&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: ecf26ade-23d5-4fca-93fe-4537ca1c44fd
X-Runtime: 0.006589
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

