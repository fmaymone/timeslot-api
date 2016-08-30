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
Authorization: Token token=gCqjmFkVy0sECLqyOPrwpJMHLos
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "image" : "salvador dali",
  "description" : "This is a description.",
  "defaultColor" : "123ABD",
  "public" : true,
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "invitees" : [
    305,
    306,
    307
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;image&quot;:&quot;salvador dali&quot;,&quot;description&quot;:&quot;This is a description.&quot;,&quot;defaultColor&quot;:&quot;123ABD&quot;,&quot;public&quot;:true,&quot;membersCanPost&quot;:true,&quot;membersCanInvite&quot;:true,&quot;invitees&quot;:[305,306,307]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=gCqjmFkVy0sECLqyOPrwpJMHLos&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;2e461f4179279d643a0584695a11db26&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 79b7d233-0f98-4266-8fbc-8ab3cb17e205
X-Runtime: 0.212868
Content-Length: 602</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "6487b23b-ac2a-4856-9699-d3194168ff65",
  "name" : "foo",
  "image" : "salvador dali",
  "description" : "This is a description.",
  "defaultColor" : "123ABD",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "public" : true,
  "createdAt" : "2016-08-30T09:50:50.060Z",
  "updatedAt" : "2016-08-30T09:50:50.060Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 308,
    "username" : "User 418",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:50.054Z",
    "updatedAt" : "2016-08-30T09:50:50.054Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    308,
    305,
    306,
    307
  ],
  "memberCount" : 4,
  "slotCount" : 0,
  "membershipState" : "active",
  "color" : "123ABD"
}
```
