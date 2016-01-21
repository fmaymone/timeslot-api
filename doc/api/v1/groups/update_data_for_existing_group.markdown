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
Authorization: Token token=Lqcyo3-mR3kPHhR-0wUe08QJjKg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/9</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/9&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Lqcyo3-mR3kPHhR-0wUe08QJjKg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9263df47aa763ec1f0f0665e2a029074&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c189a4dd-15ed-4477-887d-9084e46dc56a
X-Runtime: 0.008347
Vary: Origin
Content-Length: 391</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 9,
  "name" : "bar",
  "uuid" : "0855ea05-585c-47e1-b405-6c2fab87ec91",
  "image" : "",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2016-01-21T23:11:36.577Z",
  "updatedAt" : "2016-01-21T23:11:36.585Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 11,
    "username" : "User 89",
    "createdAt" : "2016-01-21T23:11:36.574Z",
    "updatedAt" : "2016-01-21T23:11:36.574Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
