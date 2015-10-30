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
Authorization: Token token=bCa_noBEOyX4Ci3Z_Rv5VuWyxEg
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
	-H &quot;Authorization: Token token=bCa_noBEOyX4Ci3Z_Rv5VuWyxEg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8aceb81a725a950e6643035217e40b8b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cb3dce84-2f2f-49d5-af9e-65cca2c7bc2d
X-Runtime: 0.015535
Vary: Origin
Content-Length: 405</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 9,
  "name" : "bar",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2015-10-30T15:01:01.895Z",
  "updatedAt" : "2015-10-30T15:01:01.906Z",
  "deletedAt" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "owner" : {
    "id" : 21,
    "username" : "User 74",
    "createdAt" : "2015-10-30T15:01:01.892Z",
    "updatedAt" : "2015-10-30T15:01:01.892Z",
    "deletedAt" : null,
    "image" : {
      "publicId" : null,
      "localId" : null
    }
  },
  "membershipState" : "active"
}
```
