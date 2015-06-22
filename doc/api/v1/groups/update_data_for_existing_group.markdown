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
Authorization: Token token=HmgqXgOW6pHw7eLZbPmmdspPZb8
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/14</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/14&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=HmgqXgOW6pHw7eLZbPmmdspPZb8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;52ad79f544925b71204f1b91453856b6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 050a80b1-6b15-48cd-814c-f3360dfabfb2
X-Runtime: 0.015449
Content-Length: 406</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 14,
  "name" : "bar",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2015-06-22T08:44:15.318Z",
  "updatedAt" : "2015-06-22T08:44:15.329Z",
  "deletedAt" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 64,
    "username" : "User 61",
    "createdAt" : "2015-06-22T08:44:15.315Z",
    "updatedAt" : "2015-06-22T08:44:15.315Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
