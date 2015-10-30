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
Authorization: Token token=xlcGT4_HMjyW4xz1ib5yLISrUdc
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/10</pre>

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

<pre class="request">curl &quot;http://localhost:5000/v1/groups/10&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;,&quot;localId&quot;:&quot;B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=xlcGT4_HMjyW4xz1ib5yLISrUdc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5c7018f397473e421c3eb39d1244b532&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5eaad157-0d13-4678-b700-d5ada0d0ca91
X-Runtime: 0.020278
Vary: Origin
Content-Length: 481</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 10,
  "name" : "foo",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-10-30T15:01:01.931Z",
  "updatedAt" : "2015-10-30T15:01:01.931Z",
  "deletedAt" : null,
  "image" : {
    "publicId" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
    "localId" : "B6C0A21C-07C3-493D-8B44-3BA4C9981C25/L0/001"
  },
  "owner" : {
    "id" : 22,
    "username" : "User 75",
    "createdAt" : "2015-10-30T15:01:01.927Z",
    "updatedAt" : "2015-10-30T15:01:01.927Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
