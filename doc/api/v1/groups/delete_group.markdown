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

<pre>Authorization: Token token=UpwN6mOh6CAmEa4FEa3YpBUFCIg
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/11</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/11&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=UpwN6mOh6CAmEa4FEa3YpBUFCIg&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cc451d94045b579b82e56c79a1ec0113&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b5560586-a119-4ed7-a641-8f18af11d5f7
X-Runtime: 0.101510
Vary: Origin
Content-Length: 426</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 11,
  "name" : "Testgroup 11",
  "uuid" : "fd43bd0c-70b9-42c2-92bf-971a0109962a",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-21T23:11:36.633Z",
  "updatedAt" : "2016-01-21T23:11:36.750Z",
  "deletedAt" : "2016-01-21T23:11:36.750Z",
  "owner" : {
    "id" : 13,
    "username" : "User 91",
    "createdAt" : "2016-01-21T23:11:36.630Z",
    "updatedAt" : "2016-01-21T23:11:36.666Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "deleted"
}
```
