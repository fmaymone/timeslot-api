# Groups API

## Delete group

### DELETE /v1/groups/:group_uuid

Sets &#39;deleted_at&#39; on the group and its memberships. Doesn&#39;t delete anything.

Current User must be group ownerreturns 200 and the updated data for the group

returns 403 if current user not group owner

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
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

<pre>Authorization: Token token=s9LSgtZYSv_BbrBH-fFFvybSl0s
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/bd065ca3-8e3d-42a4-8b5e-8bc1b4280dcc</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/bd065ca3-8e3d-42a4-8b5e-8bc1b4280dcc&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=s9LSgtZYSv_BbrBH-fFFvybSl0s&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;49a539eeb79ddb8affbc9abc4d38a2e2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 363a42f9-f8f1-4898-807b-ce638c09c9b7
X-Runtime: 0.369199
Vary: Origin
Content-Length: 416</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "bd065ca3-8e3d-42a4-8b5e-8bc1b4280dcc",
  "name" : "Testgroup 11",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-29T19:38:55.146Z",
  "updatedAt" : "2016-01-29T19:38:55.575Z",
  "deletedAt" : "2016-01-29T19:38:55.571Z",
  "owner" : {
    "id" : 13,
    "username" : "User 91",
    "createdAt" : "2016-01-29T19:38:55.131Z",
    "updatedAt" : "2016-01-29T19:38:55.300Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "deleted"
}
```
