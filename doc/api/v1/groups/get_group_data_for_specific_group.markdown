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
Authorization: Token token=ch1Xv_So0ZlR6urPC-cEQFoi41M
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/7</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/7&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=ch1Xv_So0ZlR6urPC-cEQFoi41M&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;89eebd73f65d40c240ff445fa4456801&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 82cb6233-ffa8-4531-8b77-6870d568084f
X-Runtime: 0.017578
Vary: Origin
Content-Length: 416</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 7,
  "name" : "Testgroup 12",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-10-30T15:01:01.760Z",
  "updatedAt" : "2015-10-30T15:01:01.760Z",
  "deletedAt" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 16,
    "username" : "User 69",
    "createdAt" : "2015-10-30T15:01:01.758Z",
    "updatedAt" : "2015-10-30T15:01:01.758Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
