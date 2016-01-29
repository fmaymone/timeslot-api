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
Authorization: Token token=-W6eLtv2w8Ogb-T56e_Gc6X-Tyo
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/aa174b18-9056-48be-aa73-3dea7cb2e520</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/aa174b18-9056-48be-aa73-3dea7cb2e520&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=-W6eLtv2w8Ogb-T56e_Gc6X-Tyo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c08a5991fffcc8345833edfc0f896043&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 233bb590-2764-4819-96f5-e7c026516ad8
X-Runtime: 0.013887
Vary: Origin
Content-Length: 382</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "aa174b18-9056-48be-aa73-3dea7cb2e520",
  "name" : "bar",
  "image" : "",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2016-01-29T19:38:54.954Z",
  "updatedAt" : "2016-01-29T19:38:54.967Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 11,
    "username" : "User 89",
    "createdAt" : "2016-01-29T19:38:54.950Z",
    "updatedAt" : "2016-01-29T19:38:54.950Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
