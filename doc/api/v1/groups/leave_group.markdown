# Groups API

## Leave group

### DELETE /v1/groups/:group_id/members

returns 200 if membership successfully invalidated

returns 401 if current user not active group member

returns 401 if current user has no membership for this group at all

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

### Request

#### Headers

<pre>Authorization: Token token=LNsMJHcqQR7KrJbc-_bVfMOlWBg
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/26/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/26/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=LNsMJHcqQR7KrJbc-_bVfMOlWBg&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: afb5a4f2-a2d7-42f5-804c-793c71a41f12
X-Runtime: 0.008453
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre></pre>
