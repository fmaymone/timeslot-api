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
Authorization: Token token=jElLMaQ9Rx4ubujf21RE7_KTXC0
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
	-H &quot;Authorization: Token token=jElLMaQ9Rx4ubujf21RE7_KTXC0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9af393a52c2ade5571d0fdac20bdb5ee&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1d5ddd80-caaa-43ef-9aee-15c8d809b326
X-Runtime: 0.011138
Vary: Origin
Content-Length: 428</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 10,
  "name" : "foo",
  "uuid" : "f5124f64-f804-47f7-ae34-d34955e83ab3",
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-21T23:11:36.602Z",
  "updatedAt" : "2016-01-21T23:11:36.612Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 12,
    "username" : "User 90",
    "createdAt" : "2016-01-21T23:11:36.599Z",
    "updatedAt" : "2016-01-21T23:11:36.599Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
