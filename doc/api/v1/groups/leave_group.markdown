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

<pre>Authorization: Token token=ZoePQyh-4n0Zeo4cKEc0Ieemg-4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/1813caa4-db7a-429c-a073-1ccfc66492bf/members</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/1813caa4-db7a-429c-a073-1ccfc66492bf/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=ZoePQyh-4n0Zeo4cKEc0Ieemg-4&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 467186b2-66d1-4c44-851b-c9ec47f442fe
X-Runtime: 0.068252
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

