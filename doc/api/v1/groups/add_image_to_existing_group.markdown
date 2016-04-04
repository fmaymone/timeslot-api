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
Authorization: Token token=J5-jtRDQiUc8Bh1Lag8f0VQ9rsw
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/9bc06d21-1f53-4fb7-ab7b-cae5882cb1e1</pre>

#### Body
```javascript
{
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/9bc06d21-1f53-4fb7-ab7b-cae5882cb1e1&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=J5-jtRDQiUc8Bh1Lag8f0VQ9rsw&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;54298f7153a1de8f1cfdb3024f968054&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 333b8e2e-a29a-4719-8b61-8c8bf889ac3f
X-Runtime: 0.011361
Vary: Origin
Content-Length: 480</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "9bc06d21-1f53-4fb7-ab7b-cae5882cb1e1",
  "name" : "foo",
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-04-04T20:50:22.028Z",
  "updatedAt" : "2016-04-04T20:50:22.039Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 14,
    "username" : "User 75",
    "createdAt" : "2016-04-04T20:50:22.025Z",
    "updatedAt" : "2016-04-04T20:50:22.025Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    14
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active"
}
```
