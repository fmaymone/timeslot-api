# Groups API

## Get group data for specific group, not member

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
Authorization: Token token=7qp1SqQ9vw8sGXrLnVPNePcIAYs
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/a4bcefda-6dca-4da1-87a1-56cc3d0f1ff1</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/a4bcefda-6dca-4da1-87a1-56cc3d0f1ff1&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=7qp1SqQ9vw8sGXrLnVPNePcIAYs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;235da23a34e87ff67d392790f21c4174&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c0c6eac2-7958-449f-97e6-e0e3069b0e6b
X-Runtime: 0.046677
Content-Length: 567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
