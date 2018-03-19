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

<pre>Authorization: Token token=LDri4__c_adLB0jtNImthJF6n70
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/f6e5c258-ec5c-49ea-8576-3b9f9cd73e4c/members</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/f6e5c258-ec5c-49ea-8576-3b9f9cd73e4c/members&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=LDri4__c_adLB0jtNImthJF6n70&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json
Vary: Accept-Encoding, Origin
Cache-Control: no-cache
X-Request-Id: 76ae2fb1-b92f-4155-a7c4-4cf19cd6f1ee
X-Runtime: 0.128227
Content-Length: 0</pre>

#### Status

<pre>200 OK</pre>

