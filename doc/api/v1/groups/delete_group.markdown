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

<pre>Authorization: Token token=hFZKcyxuPKsZYDc4eDxKkA5B9f4
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/16</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/16&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=hFZKcyxuPKsZYDc4eDxKkA5B9f4&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6c042e8afa9a748fe742164a78f011d2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 834f602b-8db7-4891-9db8-55df7758e338
X-Runtime: 0.069645
Vary: Origin
Content-Length: 440</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 16,
  "name" : "Testgroup 13",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-10-03T22:30:40.176Z",
  "updatedAt" : "2015-10-03T22:30:40.259Z",
  "deletedAt" : "2015-10-03T22:30:40.258Z",
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 95,
    "username" : "User 71",
    "createdAt" : "2015-10-03T22:30:40.173Z",
    "updatedAt" : "2015-10-03T22:30:40.206Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "deleted"
}
```
