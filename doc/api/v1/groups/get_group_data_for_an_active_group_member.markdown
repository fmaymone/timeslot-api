# Groups API

## Get group data for an active group member

### GET /v1/groups/:group_uuid

returns data of specified group

returns 404 if UUID is invalid



### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : owner
Description : user info of group owner

Name : membersCanPost
Description : Can subscribers add slots?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : image
Description : URL of the group image

Name : description
Description : The description of the group

Name : defaultColor
Description : default color of the group, can be overwritten per member

Name : createdAt
Description : Creation of group

Name : updatedAt
Description : Latest update of group in db

Name : deletedAt
Description : Deletion of group

Name : membershipState
Description : Membership state for current user

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=sTUzQbmPjmGRYkyxVHRwNrxyt8Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/68772943-f60e-400c-a1f8-8d37411244e6</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/68772943-f60e-400c-a1f8-8d37411244e6&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=sTUzQbmPjmGRYkyxVHRwNrxyt8Q&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0be00a0f4defd05bd24a07b19ad79ad7&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e6141b5c-575a-46d2-a06d-117bf10ae5fb
X-Runtime: 0.022984
Content-Length: 585</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
