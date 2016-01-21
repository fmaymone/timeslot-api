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
Authorization: Token token=Wdsp9OUp_38RuGkNL5P7Fj0svoM
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/7</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/7&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Wdsp9OUp_38RuGkNL5P7Fj0svoM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bb8d5d74b53a891705535fad6a127a38&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cb28bdc6-4892-4490-b9b8-0fc5fc2e9c06
X-Runtime: 0.010075
Vary: Origin
Content-Length: 401</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 7,
  "name" : "Testgroup 10",
  "uuid" : "32937def-8c44-4dda-8879-afc701bced50",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-21T23:11:36.482Z",
  "updatedAt" : "2016-01-21T23:11:36.482Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 6,
    "username" : "User 84",
    "createdAt" : "2016-01-21T23:11:36.480Z",
    "updatedAt" : "2016-01-21T23:11:36.480Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
