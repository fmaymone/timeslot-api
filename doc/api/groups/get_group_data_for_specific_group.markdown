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
Authorization: Token token=qqQJCAkZR9RL05QDNiROpFQvDKA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=qqQJCAkZR9RL05QDNiROpFQvDKA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;1ee31491689b82bf9c83a43e86854a5e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b6784726-b236-4d2f-9f0d-d4bb680d009e
X-Runtime: 0.008985
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
  "createdAt" : "2015-05-06T14:45:14.903Z",
  "updatedAt" : "2015-05-06T14:45:14.903Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}</pre>
