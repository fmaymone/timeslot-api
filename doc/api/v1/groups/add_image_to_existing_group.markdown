# Groups API

## Add image to existing group

### PATCH /v1/groups/:group_id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary the client updates the group with the image information.

returns 200 and the group data if the image was successfully added or updated

### Parameters

Name : group_id *- required -*
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
Authorization: Token token=MtRE2AAnU7w5tHyACyi7XdY0Hwc
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/10</pre>

#### Body
```javascript
{
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/10&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=MtRE2AAnU7w5tHyACyi7XdY0Hwc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;577f16be8a1a64f89d4ada6d093cf3dd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4f5ccfc3-afd6-44ce-a175-e429f35f1015
X-Runtime: 0.011978
Vary: Origin
Content-Length: 382</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 10,
  "name" : "foo",
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-12-23T11:18:30.511Z",
  "updatedAt" : "2015-12-23T11:18:30.522Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 12,
    "username" : "User 78",
    "createdAt" : "2015-12-23T11:18:30.508Z",
    "updatedAt" : "2015-12-23T11:18:30.508Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
