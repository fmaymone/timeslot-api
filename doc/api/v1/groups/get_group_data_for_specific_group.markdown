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
Authorization: Token token=erxafiGBOny-ww6DgU2gCL_9XCk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/e45cff1b-99eb-450d-9f4b-7a2f678b2f5a</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/e45cff1b-99eb-450d-9f4b-7a2f678b2f5a&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=erxafiGBOny-ww6DgU2gCL_9XCk&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;bc427afe2176826c352b48b37324b753&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f6e7ba73-092c-47c4-92b5-800ed80effa9
X-Runtime: 0.033982
Vary: Origin
Content-Length: 460</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "e45cff1b-99eb-450d-9f4b-7a2f678b2f5a",
  "name" : "Testgroup 4",
  "image" : "",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "public" : false,
  "createdAt" : "2016-04-04T20:50:21.784Z",
  "updatedAt" : "2016-04-04T20:50:21.784Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 2,
    "username" : "User 63",
    "createdAt" : "2016-04-04T20:50:21.782Z",
    "updatedAt" : "2016-04-04T20:50:21.782Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    1,
    5,
    4,
    3,
    2
  ],
  "memberCount" : 5,
  "slotCount" : 3,
  "membershipState" : "active"
}
```
