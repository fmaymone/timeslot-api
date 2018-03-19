# Groups API

## Get list of all active group members

### GET /v1/groups/:group_uuid/members

returns 200 and a list of all active group members

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get members for


### Response Fields

Name : groupId
Description : ID of the group

Name : size
Description : Number of active group members

Name : members
Description : Array of active members

Name : userId
Description : ID of member

Name : username
Description : name of member

Name : userUrl
Description : URL for member

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=mm_MpskOSJArohOvlNuxZwPl7i0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/54a0a978-3348-4420-ac8f-b64cb1e2c223/members</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/54a0a978-3348-4420-ac8f-b64cb1e2c223/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mm_MpskOSJArohOvlNuxZwPl7i0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2f5fb5728542b75d441dd8cb0779bb99&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8cc8e5f7-e98a-40af-8da4-ad8e1b8fee69
X-Runtime: 0.018657
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
