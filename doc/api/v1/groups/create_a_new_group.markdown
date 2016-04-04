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
Authorization: Token token=DPW-kVPdPAspTjog41sXZF4vWR8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "image" : "salvador dali",
  "public" : true,
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "invitees" : [
    9,
    10,
    11
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;image&quot;:&quot;salvador dali&quot;,&quot;public&quot;:true,&quot;membersCanPost&quot;:true,&quot;membersCanInvite&quot;:true,&quot;invitees&quot;:[9,10,11]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=DPW-kVPdPAspTjog41sXZF4vWR8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b47b0e508b2cdcc4f2140e7c163d4d69&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ddd27fc6-1e00-4fa2-9e94-9526eaa4636b
X-Runtime: 0.080494
Vary: Origin
Content-Length: 464</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "e392eaaf-ca4b-46a4-a615-d1c4b73b02a3",
  "name" : "foo",
  "image" : "salvador dali",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "public" : true,
  "createdAt" : "2016-04-04T20:50:21.905Z",
  "updatedAt" : "2016-04-04T20:50:21.905Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 12,
    "username" : "User 73",
    "createdAt" : "2016-04-04T20:50:21.899Z",
    "updatedAt" : "2016-04-04T20:50:21.899Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    11,
    10,
    9,
    12
  ],
  "memberCount" : 4,
  "slotCount" : 0,
  "membershipState" : "active"
}
```
