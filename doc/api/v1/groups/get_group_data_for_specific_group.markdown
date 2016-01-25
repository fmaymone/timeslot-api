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
Authorization: Token token=LaxVjJPnPibYjPSju5h4IKOlFBY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/7</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/7&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LaxVjJPnPibYjPSju5h4IKOlFBY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4224aee36c6b78c992e6d654fe4c390f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c61ea9f4-49d9-4366-9e20-7079c2b0fd4e
X-Runtime: 0.009229
Vary: Origin
Content-Length: 355</pre>

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
  "createdAt" : "2015-12-23T11:18:30.392Z",
  "updatedAt" : "2015-12-23T11:18:30.392Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 6,
    "username" : "User 72",
    "createdAt" : "2015-12-23T11:18:30.391Z",
    "updatedAt" : "2015-12-23T11:18:30.391Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
