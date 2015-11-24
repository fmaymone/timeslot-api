# Groups API

## Update data for existing group

### PATCH /v1/groups/:group_id

e.g. Change groupname

returns 200 if the update was successful

returns 404 if ID is invalid

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : group_id *- required -*
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
Authorization: Token token=bk2WhwJ55JI8jo7MpE2GQluFCSU
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/9</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/9&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=bk2WhwJ55JI8jo7MpE2GQluFCSU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;58e2f441644990b6e467ecfc0d637a48&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3e2494e8-b3f7-40bd-aab5-f65eefb68807
X-Runtime: 0.012755
Vary: Origin
Content-Length: 345</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 9,
  "name" : "bar",
  "image" : "",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2015-11-24T23:47:29.252Z",
  "updatedAt" : "2015-11-24T23:47:29.264Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 21,
    "username" : "User 72",
    "createdAt" : "2015-11-24T23:47:29.249Z",
    "updatedAt" : "2015-11-24T23:47:29.249Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
