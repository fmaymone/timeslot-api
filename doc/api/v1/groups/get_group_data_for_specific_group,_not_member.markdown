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
Authorization: Token token=Tbi3v8JNFXn5PF3yoQzEtOGn9po
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/2265a825-30ed-4744-8d1a-574893b94820</pre>

#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/2265a825-30ed-4744-8d1a-574893b94820&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Tbi3v8JNFXn5PF3yoQzEtOGn9po&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d22c23c634961794d303b6cd5980755e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f8ec5c62-499d-4399-9e3a-0ae28c65efad
X-Runtime: 0.132754
Content-Length: 567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
