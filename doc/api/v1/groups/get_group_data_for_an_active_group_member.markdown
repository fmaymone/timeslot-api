# Groups API

## Get group data for an active group member

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
Authorization: Token token=fw5Sf8GPNMH3n0NKSSV55nDPjys
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/e0cc8fe3-cb04-48c2-a67e-c268e9629073</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/e0cc8fe3-cb04-48c2-a67e-c268e9629073&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=fw5Sf8GPNMH3n0NKSSV55nDPjys&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;23be823bf9dd6bda0c44e43317b55b89&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 95ee9b47-efb2-4fb3-8cc1-0bf306664e6f
X-Runtime: 0.009150
Content-Length: 585</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "e0cc8fe3-cb04-48c2-a67e-c268e9629073",
  "name" : "Testgroup 129",
  "image" : "",
  "description" : null,
  "defaultColor" : "000000",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : true,
  "createdAt" : "2016-08-30T09:50:49.969Z",
  "updatedAt" : "2016-08-30T09:50:49.969Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 298,
    "username" : "User 408",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:49.967Z",
    "updatedAt" : "2016-08-30T09:50:49.967Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    298,
    299,
    300,
    301,
    297
  ],
  "memberCount" : 5,
  "slotCount" : 3,
  "membershipState" : "active",
  "color" : "AA12CC"
}
```
