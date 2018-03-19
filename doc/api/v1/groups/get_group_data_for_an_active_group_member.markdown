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
Authorization: Token token=LmIJ_R7W-1qyk0fEG5Emeui-qzI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/d7cb4025-9b51-4f35-b66f-80e14546ed93</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/d7cb4025-9b51-4f35-b66f-80e14546ed93&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LmIJ_R7W-1qyk0fEG5Emeui-qzI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b79d72dcab163978ffe002ebe798f8fa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bf6c91be-a7ec-4826-aaf1-102f72c7246b
X-Runtime: 0.027022
Content-Length: 585</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
