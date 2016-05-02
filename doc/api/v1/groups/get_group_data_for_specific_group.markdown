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

Name : description
Description : The description of the group

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
Authorization: Token token=rG1IcTAZiD5JCKT5hvXPrsT6EkI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/54830562-869e-4308-bfe1-37374fe8ea57</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/54830562-869e-4308-bfe1-37374fe8ea57&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=rG1IcTAZiD5JCKT5hvXPrsT6EkI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f269d2a38bd5cba72f2d9695360ee64c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c116e954-7a04-45b5-8153-77b0f6f1cfbe
X-Runtime: 0.028251
Content-Length: 488</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "54830562-869e-4308-bfe1-37374fe8ea57",
  "name" : "Testgroup 108",
  "image" : "",
  "description" : null,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-05-01T22:54:08.137Z",
  "updatedAt" : "2016-05-01T22:54:08.137Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 94,
    "username" : "User 209",
    "createdAt" : "2016-05-01T22:54:08.135Z",
    "updatedAt" : "2016-05-01T22:54:08.135Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    93,
    94,
    95,
    96,
    97
  ],
  "memberCount" : 5,
  "slotCount" : 3,
  "membershipState" : "active"
}
```
