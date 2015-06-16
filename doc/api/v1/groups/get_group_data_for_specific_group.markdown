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
Authorization: Token token=kRkxOc0xhCbN2oCQI8157MfPe-U
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/12</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/12&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=kRkxOc0xhCbN2oCQI8157MfPe-U&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b1035aede4ec7d5385257ac733a3cdcd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 832faa63-2250-4322-a5ee-44baadb2df13
X-Runtime: 0.017089
Content-Length: 411</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 12,
  "name" : "Testgroup 12",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-06-16T15:49:50.186Z",
  "updatedAt" : "2015-06-16T15:49:50.186Z",
  "deletedAt" : null,
  "image" : {
    "clyid" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 59,
    "username" : "User 56",
    "createdAt" : "2015-06-16T15:49:50.184Z",
    "updatedAt" : "2015-06-16T15:49:50.184Z",
    "deletedAt" : null,
    "image" : {
      "clyid" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
