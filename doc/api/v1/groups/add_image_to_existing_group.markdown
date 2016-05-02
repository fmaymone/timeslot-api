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
Authorization: Token token=ZsnrZeA1ZB2lzF5SwZ8n9Q0N1Qg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/7f880f41-bb3c-477d-8798-cd7c3b6d4e76</pre>

#### Body
```javascript
{
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/7f880f41-bb3c-477d-8798-cd7c3b6d4e76&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=ZsnrZeA1ZB2lzF5SwZ8n9Q0N1Qg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1525e9f12f49bfc010deae2c1f344c7a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 03c88326-3135-4b8f-a68a-da22ce64237a
X-Runtime: 0.017340
Content-Length: 522</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "7f880f41-bb3c-477d-8798-cd7c3b6d4e76",
  "name" : "foo",
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "description" : "This is a description.",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-05-01T22:54:08.396Z",
  "updatedAt" : "2016-05-01T22:54:08.412Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 106,
    "username" : "User 221",
    "createdAt" : "2016-05-01T22:54:08.393Z",
    "updatedAt" : "2016-05-01T22:54:08.393Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    106
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active"
}
```
