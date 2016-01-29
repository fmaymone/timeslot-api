# Groups API

## Get group data for specific group

### GET /v1/groups/:group_uuid

returns data of specified group

returns 404 if UUID is invalid



### Parameters

Name : group_uuid *- required -*
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
Authorization: Token token=FkUHYO6iUzOlOOzpmBwbDtls63Y
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/cd2bf982-19d3-41dd-b8dc-9fbbe49ecdee</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/cd2bf982-19d3-41dd-b8dc-9fbbe49ecdee&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=FkUHYO6iUzOlOOzpmBwbDtls63Y&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1ca571a6715dd6f33719f726965fdc1b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 0c256499-7173-4d4c-99af-095b454f71f9
X-Runtime: 0.011400
Vary: Origin
Content-Length: 392</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "cd2bf982-19d3-41dd-b8dc-9fbbe49ecdee",
  "name" : "Testgroup 10",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-29T19:38:54.843Z",
  "updatedAt" : "2016-01-29T19:38:54.843Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 6,
    "username" : "User 84",
    "createdAt" : "2016-01-29T19:38:54.841Z",
    "updatedAt" : "2016-01-29T19:38:54.841Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
