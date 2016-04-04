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
Authorization: Token token=EJ7UItJyn8uUtvkCp_9HN3EyU_o
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/c67b6f48-6918-4f68-83d7-e085e77863e6</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/c67b6f48-6918-4f68-83d7-e085e77863e6&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=EJ7UItJyn8uUtvkCp_9HN3EyU_o&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;acc693cae0263e361c96577fa6e63741&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 540c9a61-ed26-49d7-84bc-01d1bf4b8bbc
X-Runtime: 0.011145
Vary: Origin
Content-Length: 444</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "c67b6f48-6918-4f68-83d7-e085e77863e6",
  "name" : "bar",
  "image" : "",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "public" : false,
  "createdAt" : "2016-04-04T20:50:22.001Z",
  "updatedAt" : "2016-04-04T20:50:22.010Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 13,
    "username" : "User 74",
    "createdAt" : "2016-04-04T20:50:21.997Z",
    "updatedAt" : "2016-04-04T20:50:21.997Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    13
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active"
}
```
