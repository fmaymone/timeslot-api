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
Authorization: Token token=M3SrbCjG2b_cfZw3DwFdSbCJ5Hs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/a16ad757-4a2d-4d4b-a1a5-eb0a6ea819f3/members</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/a16ad757-4a2d-4d4b-a1a5-eb0a6ea819f3/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=M3SrbCjG2b_cfZw3DwFdSbCJ5Hs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1d26d509432c8485e60d4065fb9b5822&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 456afa3a-3ebe-4e80-a4f2-9ba7187f64b9
X-Runtime: 0.017910
Content-Length: 1065</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
