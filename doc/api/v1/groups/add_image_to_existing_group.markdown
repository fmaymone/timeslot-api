# Groups API

## Add image to existing group

### PATCH /v1/groups/:group_uuid

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary the client updates the group with the image information.

returns 200 and the group data if the image was successfully added or updated

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to update

Name : image *- required -*
Description : Cloudinary ID / URL


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
Authorization: Token token=Jjb6RrD1Y6KVzI-B1CflXE-nb1A
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/c7d68b49-ff0a-42a4-a3ef-38db55828ad6</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/c7d68b49-ff0a-42a4-a3ef-38db55828ad6&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Jjb6RrD1Y6KVzI-B1CflXE-nb1A&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8608e8ccf2ea8185645f923b5f39aa24&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 16493dc4-2bd0-4ec8-a778-6a62b6ddaaae
X-Runtime: 0.043843
Content-Length: 614</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
