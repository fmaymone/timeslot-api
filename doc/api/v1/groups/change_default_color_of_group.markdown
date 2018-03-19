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
Authorization: Token token=9lu7BL1y00IY9P1ejt6xr3Hecn0
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/025d0031-232e-43bf-a697-e5001c2b8fab</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/025d0031-232e-43bf-a697-e5001c2b8fab&quot; -d &#39;{&quot;defaultColor&quot;:&quot;12AB67&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=9lu7BL1y00IY9P1ejt6xr3Hecn0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;19c82a251bbe2ecb03181d9ecd3aa762&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ad23b6f5-0f46-4c9b-acd3-ad620e19017a
X-Runtime: 0.047645
Content-Length: 580</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
