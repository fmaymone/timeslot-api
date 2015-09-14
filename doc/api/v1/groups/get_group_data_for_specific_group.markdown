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
Authorization: Token token=UNBSRjt7RpJNpFgj9X-7Zs6nJYQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=UNBSRjt7RpJNpFgj9X-7Zs6nJYQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;814ddfd23085d8a3f4c2d68e13414fa8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2de5a333-f020-4f12-bc90-5b2f7c78117a
X-Runtime: 0.020705
Vary: Origin
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
  "createdAt" : "2015-09-14T10:32:38.991Z",
  "updatedAt" : "2015-09-14T10:32:38.991Z",
  "deletedAt" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 88,
    "username" : "User 64",
    "createdAt" : "2015-09-14T10:32:38.989Z",
    "updatedAt" : "2015-09-14T10:32:38.989Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
