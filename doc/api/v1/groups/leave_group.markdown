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

<pre>Authorization: Token token=KCsn0j-Eyj_a0GyVPx8xgCQVmV8
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/ffaf7128-af52-43af-93a6-a3e9bda7adf5/members</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/ffaf7128-af52-43af-93a6-a3e9bda7adf5/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=KCsn0j-Eyj_a0GyVPx8xgCQVmV8&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: b5ead6ba-5c4a-4d69-bb5a-35015e0ab67a
X-Runtime: 0.129613
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

