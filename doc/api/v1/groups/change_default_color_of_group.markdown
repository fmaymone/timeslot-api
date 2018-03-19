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
Authorization: Token token=G5qUPHFt3WwjMx3gjTsqBsO7ab8
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/6470e740-21cd-4504-9b45-f132fc240a7b</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/6470e740-21cd-4504-9b45-f132fc240a7b&quot; -d &#39;{&quot;defaultColor&quot;:&quot;12AB67&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=G5qUPHFt3WwjMx3gjTsqBsO7ab8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b77a530629cb605cfd6bde8a55da09cd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3359e75d-ce9e-4fcb-9b0f-9fa5787a20e4
X-Runtime: 0.030407
Content-Length: 580</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
