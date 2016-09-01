# Groups API

## Get group data for specific group, not member

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

Name : description
Description : The description of the group

Name : defaultColor
Description : default color of the group, can be overwritten per member

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
Authorization: Token token=NPmeDJYtDKhzIw2GpguBgW0Jdx0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/ea5636ae-b815-49d2-99ec-f0d249074e9f</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/ea5636ae-b815-49d2-99ec-f0d249074e9f&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=NPmeDJYtDKhzIw2GpguBgW0Jdx0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;d3aa70ae6b2db3c9e8fbce2d8a2d560f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2fc2fb22-7799-4498-b21b-661b22181d32
X-Runtime: 0.023761
Content-Length: 567</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "ea5636ae-b815-49d2-99ec-f0d249074e9f",
  "name" : "Testgroup 128",
  "image" : "",
  "description" : null,
  "defaultColor" : "000000",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : true,
  "createdAt" : "2016-08-30T09:50:49.863Z",
  "updatedAt" : "2016-08-30T09:50:49.863Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 289,
    "username" : "User 399",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:49.861Z",
    "updatedAt" : "2016-08-30T09:50:49.861Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    289,
    290,
    291,
    292
  ],
  "memberCount" : 4,
  "slotCount" : 3,
  "membershipState" : "undefined"
}
```
