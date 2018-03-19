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
Authorization: Token token=V2Few6DWnEWfl8ZTDKFJgbev1pw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/9778ab9e-8a08-4808-9979-99060ed30f39/members</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/9778ab9e-8a08-4808-9979-99060ed30f39/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=V2Few6DWnEWfl8ZTDKFJgbev1pw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7d1a0d2d65a344832a7be3e4b9386e71&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c70ede6a-cdf3-4a56-b8c2-3c70df0d942d
X-Runtime: 0.022233
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
