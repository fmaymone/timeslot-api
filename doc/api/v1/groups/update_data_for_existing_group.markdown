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
Authorization: Token token=9PHlYOe1BPqafIFg7khT7yaCrwU
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/0df3435a-ec6f-490d-b93b-a2c0a62adcd2</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/0df3435a-ec6f-490d-b93b-a2c0a62adcd2&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;description&quot;:&quot;This is a new description.&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=9PHlYOe1BPqafIFg7khT7yaCrwU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b78af03eeb96799a7074bd5c46828f64&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 43fa2e89-faaa-4114-bc61-ff4287328bae
X-Runtime: 0.058656
Content-Length: 582</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
