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
Authorization: Token token=LEoOZVyMmKlX0xUa6F9l3e3mfSk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "invitees" : [
    80,
    81,
    82
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;invitees&quot;:[80,81,82]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=LEoOZVyMmKlX0xUa6F9l3e3mfSk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;357a654bab521c779c27ac10a01f7076&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: cf68f3c3-03eb-424f-91d2-7b547fb80f4b
X-Runtime: 0.042981
Content-Length: 351</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 13,
  "name" : "foo",
  "membersCanPost" : true,
  "membersCanInvite" : false,
  "createdAt" : "2015-06-03T10:39:36.680Z",
  "updatedAt" : "2015-06-03T10:39:36.680Z",
  "deletedAt" : null,
  "image" : null,
  "owner" : {
    "id" : 83,
    "username" : "User 80",
    "createdAt" : "2015-06-03T10:39:36.672Z",
    "updatedAt" : "2015-06-03T10:39:36.672Z",
    "deletedAt" : null,
    "image" : null
  },
  "membershipState" : "active"
}
```
