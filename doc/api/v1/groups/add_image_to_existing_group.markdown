# Groups API

## Add image to existing group

### PATCH /v1/groups/:group_id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary the client updates the group with the image information.

returns 200 and the group data if the image was successfully added or updated

### Parameters

Name : group_id *- required -*
Description : ID of the group to update

Name : image *- required -*
Description : Scope for attributes of new image

Name : publicId *- required -*
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
Authorization: Token token=F6EIZjlTtg5G4hG9YwACGi-UeSg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/15</pre>

#### Body
```javascript
{
  "image" : {
    "publicId" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/15&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=F6EIZjlTtg5G4hG9YwACGi-UeSg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b7c84dcd8597308bc220ca2e1ec98ded&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ebcdd63b-e673-4f24-a73c-78e08de0a1c1
X-Runtime: 0.019142
Content-Length: 384</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 15,
  "name" : "foo",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-06-03T10:39:36.778Z",
  "updatedAt" : "2015-06-03T10:39:36.778Z",
  "deletedAt" : null,
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "owner" : {
    "id" : 85,
    "username" : "User 82",
    "createdAt" : "2015-06-03T10:39:36.774Z",
    "updatedAt" : "2015-06-03T10:39:36.774Z",
    "deletedAt" : null,
    "image" : null
  },
  "membershipState" : "active"
}
```
