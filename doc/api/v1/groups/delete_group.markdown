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

<pre>Authorization: Token token=Y1DfFqoA6Y5Q6myFcUxlKCrl4NU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/11</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/11&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=Y1DfFqoA6Y5Q6myFcUxlKCrl4NU&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;67c753843a127d9eea668a4ec68538f0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4e35237e-f5f2-405d-a231-796855d17f68
X-Runtime: 0.072967
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
  "createdAt" : "2015-11-24T23:47:29.315Z",
  "updatedAt" : "2015-11-24T23:47:29.409Z",
  "deletedAt" : "2015-11-24T23:47:29.409Z",
  "owner" : {
    "id" : 23,
    "username" : "User 74",
    "createdAt" : "2015-11-24T23:47:29.312Z",
    "updatedAt" : "2015-11-24T23:47:29.360Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "deleted"
}
```
