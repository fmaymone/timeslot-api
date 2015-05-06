# Groups API

## Get group data for specific group

### GET /v1/groups/:group_id

returns data of specified group

returns 404 if ID is invalid



### Parameters

Name : group_id *- required -*
Description : ID of the group to get


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : ownerId
Description : user id of group owner

Name : membersCanPost
Description : Can subscribers add slots?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : image
Description : URL of the group image

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
Authorization: Token token=m7rOS4Gg9F3XJHMllzd2O4cNC-Q
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=m7rOS4Gg9F3XJHMllzd2O4cNC-Q&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;51e45ad18be8c1d2c375f04af12b3de6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7fb0c9d0-013f-4296-be15-f9bd0483b9e8
X-Runtime: 0.008996
Content-Length: 227</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 12,
  "name" : "Testgroup 12",
  "ownerId" : 48,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-06T11:28:49.388Z",
  "updatedAt" : "2015-05-06T11:28:49.388Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}</pre>
