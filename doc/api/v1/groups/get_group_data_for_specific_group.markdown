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
Authorization: Token token=WVe4LfvU1FII7RYCKRAVaveuRLA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/7</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/7&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=WVe4LfvU1FII7RYCKRAVaveuRLA&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;2adaf80fa5a700c0356c25850019ff61&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4377f504-e53f-4816-8230-1bb847acac9b
X-Runtime: 0.010032
Vary: Origin
Content-Length: 356</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 7,
  "name" : "Testgroup 12",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-11-17T23:46:10.667Z",
  "updatedAt" : "2015-11-17T23:46:10.667Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 16,
    "username" : "User 71",
    "createdAt" : "2015-11-17T23:46:10.666Z",
    "updatedAt" : "2015-11-17T23:46:10.666Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
