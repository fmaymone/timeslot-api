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
Authorization: Token token=18hQM9RF-yGEGsMitwnp9DUABZ4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "invitees" : [
    7,
    8,
    9
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;invitees&quot;:[7,8,9]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=18hQM9RF-yGEGsMitwnp9DUABZ4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;60ae09c03b50d6306650a45250290202&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ccb53549-cce6-4a07-96e6-c2487dfce142
X-Runtime: 0.035558
Vary: Origin
Content-Length: 392</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 8,
  "name" : "foo",
  "uuid" : "82f44fff-14fc-4809-a8ab-a7d26ba0f3ee",
  "image" : "",
  "membersCanPost" : true,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-21T23:11:36.524Z",
  "updatedAt" : "2016-01-21T23:11:36.524Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 10,
    "username" : "User 88",
    "createdAt" : "2016-01-21T23:11:36.519Z",
    "updatedAt" : "2016-01-21T23:11:36.519Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
