# Groups API

## Update settings of joined group

### PATCH /v1/groups/:group_id/members

Change notifications and default alerts for group

returns 200 if setting was successfully updated

returns 403 if user not active group member

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group to delete

Name : notifications
Description : receive notifications?

Name : defaultAlerts
Description : set default alerts for slots in this group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=4tLUL6lBT_zlz73xViCccoqFNUA
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/32/members</pre>

#### Body

<pre>{"settings":{"notifications":"false","defaultAlerts":"1111100000"}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/32/members&quot; -d &#39;{&quot;settings&quot;:{&quot;notifications&quot;:&quot;false&quot;,&quot;defaultAlerts&quot;:&quot;1111100000&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=4tLUL6lBT_zlz73xViCccoqFNUA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
ETag: &quot;7215ee9c7d9dc229d2921a40e899ec5f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5ce55a0d-ec37-41f7-96ab-1e4c7a987f5a
X-Runtime: 0.008184
Content-Length: 1</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre></pre>
