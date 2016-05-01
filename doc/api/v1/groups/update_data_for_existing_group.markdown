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
Authorization: Token token=Ln_lBMpgZ5WTmzd9rSqkpCtz6cY
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/e887e887-9c66-4949-9c50-b6add562628e</pre>

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

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/e887e887-9c66-4949-9c50-b6add562628e&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;description&quot;:&quot;This is a new description.&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Ln_lBMpgZ5WTmzd9rSqkpCtz6cY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7617e6ba544970517035c55510515faf&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7ebef8c0-1d16-4f82-a0da-8e910db836d6
X-Runtime: 0.015493
Content-Length: 490</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "e887e887-9c66-4949-9c50-b6add562628e",
  "name" : "bar",
  "image" : "",
  "description" : "This is a new description.",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "public" : false,
  "createdAt" : "2016-05-01T22:54:08.365Z",
  "updatedAt" : "2016-05-01T22:54:08.373Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 105,
    "username" : "User 220",
    "createdAt" : "2016-05-01T22:54:08.361Z",
    "updatedAt" : "2016-05-01T22:54:08.361Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    105
  ],
  "memberCount" : 1,
  "slotCount" : 0,
  "membershipState" : "active"
}
```
