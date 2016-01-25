# Groups API

## Delete group

### DELETE /v1/groups/:group_id

Sets &#39;deleted_at&#39; on the group and its memberships. Doesn&#39;t delete anything.

Current User must be group ownerreturns 200 and the updated data for the group

returns 403 if current user not group owner

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to delete


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

<pre>Authorization: Token token=_K5Qe09iRBrNFN1FQppAsQ-oKfU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/11</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/11&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=_K5Qe09iRBrNFN1FQppAsQ-oKfU&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;95e9a69e01f7dc18e209fb44eb73a7c5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ba58be32-e8ea-443e-9d2f-4cc35c89ef75
X-Runtime: 0.099446
Vary: Origin
Content-Length: 380</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 11,
  "name" : "Testgroup 13",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-12-23T11:18:30.542Z",
  "updatedAt" : "2015-12-23T11:18:30.659Z",
  "deletedAt" : "2015-12-23T11:18:30.658Z",
  "owner" : {
    "id" : 13,
    "username" : "User 79",
    "createdAt" : "2015-12-23T11:18:30.539Z",
    "updatedAt" : "2015-12-23T11:18:30.574Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "deleted"
}
```
