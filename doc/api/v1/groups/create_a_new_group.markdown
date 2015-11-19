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

Name : membersCanPost
Description : Can subscribers post?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : invitees
Description : Array of User IDs to be invited


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
Accept: application/json
Authorization: Token token=p5WOkCYxHhbwfrh-W1o_mFBr-nk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "invitees" : [
    17,
    18,
    19
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;invitees&quot;:[17,18,19]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=p5WOkCYxHhbwfrh-W1o_mFBr-nk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c2188b83c685fef3e66a2f3d307ad1e6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4ca3ae23-c36e-40e8-b9ed-79eb10fc39ff
X-Runtime: 0.044335
Vary: Origin
Content-Length: 346</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 8,
  "name" : "foo",
  "image" : "",
  "membersCanPost" : true,
  "membersCanInvite" : false,
  "createdAt" : "2015-11-17T23:46:10.715Z",
  "updatedAt" : "2015-11-17T23:46:10.715Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 20,
    "username" : "User 75",
    "createdAt" : "2015-11-17T23:46:10.707Z",
    "updatedAt" : "2015-11-17T23:46:10.707Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
