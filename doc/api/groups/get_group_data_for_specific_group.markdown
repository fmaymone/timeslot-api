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

Name : ownerId
Description : user id of group owner

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
Authorization: Token token=L9cJAdiv5vC7YMf5TCwHewHlwkQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=L9cJAdiv5vC7YMf5TCwHewHlwkQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5d3861aa6716df44e9ce857b8ff5b410&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cc359dd7-f1cc-4f68-a269-8c7b3e0267af
X-Runtime: 0.021509
Content-Length: 227</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 12,
  "name" : "Testgroup 12",
  "ownerId" : 58,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-19T10:51:49.107Z",
  "updatedAt" : "2015-05-19T10:51:49.107Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}
```
