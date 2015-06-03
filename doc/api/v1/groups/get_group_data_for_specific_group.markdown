# Groups API

## Get group data for specific group

### GET /v1/groups/:group_id

returns data of specified group

returns 404 if ID is invalid



### Parameters

Name : group_id *- required -*
Description : ID of the group to get


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

<pre>Accept: application/json
Authorization: Token token=pIOO-RlvgmV6MAGoUS_FecfI_og
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=pIOO-RlvgmV6MAGoUS_FecfI_og&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;62a2662c0b4bd1b428196b446b5283fa&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b400bb76-dd5a-492f-9108-fabe9eaee2bb
X-Runtime: 0.013027
Content-Length: 361</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 12,
  "name" : "Testgroup 12",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-06-03T10:39:36.632Z",
  "updatedAt" : "2015-06-03T10:39:36.632Z",
  "deletedAt" : null,
  "image" : null,
  "owner" : {
    "id" : 79,
    "username" : "User 76",
    "createdAt" : "2015-06-03T10:39:36.631Z",
    "updatedAt" : "2015-06-03T10:39:36.631Z",
    "deletedAt" : null,
    "image" : null
  },
  "membershipState" : "active"
}
```
