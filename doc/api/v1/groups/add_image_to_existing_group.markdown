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

Name : localId
Description : IOS local identifier


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
Authorization: Token token=q7CPFdri1SxGW3llvwlvPCY2ZSY
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/15</pre>

#### Body
```javascript
{
  "image" : {
    "publicId" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
    "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/15&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;,&quot;localId&quot;:&quot;B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=q7CPFdri1SxGW3llvwlvPCY2ZSY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;19720f682dbdbc34a3ad0567e1e07564&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 036a0dd6-0fba-444a-a74d-24ae0db6c826
X-Runtime: 0.021582
Content-Length: 475</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 15,
  "name" : "foo",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-06-16T15:49:50.540Z",
  "updatedAt" : "2015-06-16T15:49:50.540Z",
  "deletedAt" : null,
  "image" : {
    "clyid" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
    "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
  },
  "owner" : {
    "id" : 65,
    "username" : "User 62",
    "createdAt" : "2015-06-16T15:49:50.537Z",
    "updatedAt" : "2015-06-16T15:49:50.537Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
