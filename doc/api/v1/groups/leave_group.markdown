# Groups API

## Leave group

### DELETE /v1/groups/:group_uuid/members

returns 200 if membership successfully invalidated

returns 403 if current user not active group member

returns 403 if current user has no membership for this group at all

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

Name : keep_slots_in_schedule
Description : Set to true to prevent the removal of the calendar slots from the users schedule. Default: false

### Request

#### Headers

<pre>Authorization: Token token=3_RuXT0JcaDEu8zCX-oV9NRoyJ4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/4e3bcc11-9820-45a5-9e13-340e16ef85e1/members</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/4e3bcc11-9820-45a5-9e13-340e16ef85e1/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=3_RuXT0JcaDEu8zCX-oV9NRoyJ4&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 3b10dabb-634b-4bbf-afa8-c2b70e0b0d88
X-Runtime: 0.097762
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

