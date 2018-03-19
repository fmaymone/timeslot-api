# Groups API

## Create a new group

### POST /v1/groups

Current User is the group owner andalso initially an active group member.

returns 201 and data of new group

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : name *- required -*
Description : Name of group (max. 255 characters)

Name : image
Description : Image for the group

Name : description
Description : Description of the group (max. 255 characters)

Name : defaultColor
Description : Default color of the group (6 characters)

Name : public
Description : Is the group public? (true/false), default: &#39;false&#39;

Name : membersCanPost
Description : Can members add slots? (true/false), default: &#39;false&#39;

Name : membersCanInvite
Description : Can members add other users? (true/false), default: &#39;false&#39;

Name : invitees
Description : Array of User IDs to be added to the group


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
Accept: application/json
Authorization: Token token=zDtrAdgd117NBtLONut-BIvxE8M
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;image&quot;:&quot;salvador dali&quot;,&quot;description&quot;:&quot;This is a description.&quot;,&quot;defaultColor&quot;:&quot;123ABD&quot;,&quot;public&quot;:true,&quot;membersCanPost&quot;:true,&quot;membersCanInvite&quot;:true,&quot;invitees&quot;:[304,305,306]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=zDtrAdgd117NBtLONut-BIvxE8M&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;fd063db8c8e28cf397901003722e08d1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a35121de-5931-4b09-863b-87d916d19de3
X-Runtime: 0.431793
Content-Length: 602</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
