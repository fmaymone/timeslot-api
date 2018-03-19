# Groups API

## Change default color of group

### PATCH /v1/groups/:group_uuid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to update

Name : defaultColor *- required -*
Description : new default color


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

<pre>Content-Type: application/json
Authorization: Token token=GssVfAKPBO6VhE7KdceOqf6gmx4
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/3d3933d0-ea18-4716-96e9-5ea07c3e6353</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/3d3933d0-ea18-4716-96e9-5ea07c3e6353&quot; -d &#39;{&quot;defaultColor&quot;:&quot;12AB67&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=GssVfAKPBO6VhE7KdceOqf6gmx4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7a5f2d700740cd5e0856a3570914632d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c94ba3a2-d8fb-41f3-9935-d9d054575db5
X-Runtime: 0.038796
Content-Length: 580</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
