# Groups API

## Update data for existing group

### PATCH /v1/groups/:group_id

e.g. Change groupname

returns 200 if the update was successful

returns 404 if ID is invalid

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to update

Name : name
Description : Updated name of group (max. 255 characters)

Name : membersCanInvite
Description : Allows members to invite other users

Name : membersCanPost
Description : Allows members to post new slots


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

<pre>Content-Type: application/json
Authorization: Token token=XC-WsxtwU4SfgfP2Wjy9oNsecTg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/14</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/14&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=XC-WsxtwU4SfgfP2Wjy9oNsecTg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;87c900950b1aacb762009f7fc5d626ee&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95a8ff3d-736f-4353-a81f-c226ce103067
X-Runtime: 0.011330
Content-Length: 350</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 14,
  "name" : "bar",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2015-06-03T10:39:36.749Z",
  "updatedAt" : "2015-06-03T10:39:36.759Z",
  "deletedAt" : null,
  "image" : null,
  "owner" : {
    "id" : 84,
    "username" : "User 81",
    "createdAt" : "2015-06-03T10:39:36.746Z",
    "updatedAt" : "2015-06-03T10:39:36.746Z",
    "deletedAt" : null,
    "image" : null
  },
  "membershipState" : "active"
}
```
