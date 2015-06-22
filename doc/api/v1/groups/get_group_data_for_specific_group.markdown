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
Authorization: Token token=PoVUfqfqA5t8Dc8U6HfPVQznK84
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=PoVUfqfqA5t8Dc8U6HfPVQznK84&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;e496fc99b3e1bcb7648625e8786ee641&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3b5e6d2e-47f7-4da7-a16f-8ab2f40b987b
X-Runtime: 0.016484
Content-Length: 417</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 12,
  "name" : "Testgroup 12",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-06-22T08:44:15.068Z",
  "updatedAt" : "2015-06-22T08:44:15.068Z",
  "deletedAt" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 59,
    "username" : "User 56",
    "createdAt" : "2015-06-22T08:44:15.066Z",
    "updatedAt" : "2015-06-22T08:44:15.066Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
