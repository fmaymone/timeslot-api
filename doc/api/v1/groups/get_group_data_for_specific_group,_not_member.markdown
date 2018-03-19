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
Authorization: Token token=WmsOQkHjtL_PwfeY9KTFReDjrhA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/bdbbb2ba-f9b4-48c5-91d5-40ee1891da6a</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/bdbbb2ba-f9b4-48c5-91d5-40ee1891da6a&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=WmsOQkHjtL_PwfeY9KTFReDjrhA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1d1e416cacdbe67db9863305a92080cb&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 34c9f17e-b9d8-42c0-bd4d-807e19370c9f
X-Runtime: 0.064872
Content-Length: 567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
