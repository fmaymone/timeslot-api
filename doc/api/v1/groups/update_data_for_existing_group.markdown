# Groups API

## Update data for existing group

### PATCH /v1/groups/:group_uuid

e.g. Change groupname

returns 200 if the update was successful

returns 404 if UUID is invalid

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to update

Name : name
Description : Updated name of group (max. 255 characters)

Name : description
Description : Updated description of group (max. 255 characters)

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

<pre>Content-Type: application/json
Authorization: Token token=cP61YxmWueKzXEPJj7n1nmEDQvI
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/06a1a2f1-ab1c-4902-b621-aa6ce9b7ca33</pre>

#### Body
```javascript
{
  "name" : "bar",
  "description" : "This is a new description.",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/06a1a2f1-ab1c-4902-b621-aa6ce9b7ca33&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;description&quot;:&quot;This is a new description.&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=cP61YxmWueKzXEPJj7n1nmEDQvI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;f7fd3f26c5fa3eb9d46f8f385c8b9294&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 833399e0-5828-48b5-82da-d30dc8d1a0da
X-Runtime: 0.018741
Content-Length: 582</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "06a1a2f1-ab1c-4902-b621-aa6ce9b7ca33",
  "name" : "bar",
  "image" : "",
  "description" : "This is a new description.",
  "defaultColor" : "000000",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "public" : false,
  "createdAt" : "2016-08-30T09:50:50.287Z",
  "updatedAt" : "2016-08-30T09:50:50.299Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 309,
    "username" : "User 419",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:50.283Z",
    "updatedAt" : "2016-08-30T09:50:50.283Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    309
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active",
  "color" : "000000"
}
```
