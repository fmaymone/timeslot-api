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
Authorization: Token token=2mR4MF1BBlmT27pyG_x5y7PbBEM
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/97f56b57-83fa-4dee-a484-6a9a4166a831</pre>

#### Body
```javascript
{
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/97f56b57-83fa-4dee-a484-6a9a4166a831&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=2mR4MF1BBlmT27pyG_x5y7PbBEM&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8c8b0ee4233542a52ab08efbcfd5769f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2d8573dc-a511-4311-9bae-add9fc476e68
X-Runtime: 0.024121
Content-Length: 614</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "97f56b57-83fa-4dee-a484-6a9a4166a831",
  "name" : "foo",
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "description" : "This is a description.",
  "defaultColor" : "000000",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-08-30T09:50:50.325Z",
  "updatedAt" : "2016-08-30T09:50:50.337Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 310,
    "username" : "User 420",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:50.321Z",
    "updatedAt" : "2016-08-30T09:50:50.321Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    310
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active",
  "color" : "000000"
}
```
