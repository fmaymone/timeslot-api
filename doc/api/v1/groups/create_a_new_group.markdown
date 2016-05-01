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
Authorization: Token token=N1qUKfzCU_7Nub5_bh2CFzhTCCE
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
  "public" : true,
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "invitees" : [
    101,
    102,
    103
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;image&quot;:&quot;salvador dali&quot;,&quot;description&quot;:&quot;This is a description.&quot;,&quot;public&quot;:true,&quot;membersCanPost&quot;:true,&quot;membersCanInvite&quot;:true,&quot;invitees&quot;:[101,102,103]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=N1qUKfzCU_7Nub5_bh2CFzhTCCE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;4922791cfc998098c46ba77694619b77&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ef122f4a-d0ee-4941-a667-d94035df3ec4
X-Runtime: 0.091862
Content-Length: 510</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "9cb9c4ca-6818-45f2-acf5-35a52353202d",
  "name" : "foo",
  "image" : "salvador dali",
  "description" : "This is a description.",
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "public" : true,
  "createdAt" : "2016-05-01T22:54:08.260Z",
  "updatedAt" : "2016-05-01T22:54:08.260Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 104,
    "username" : "User 219",
    "createdAt" : "2016-05-01T22:54:08.255Z",
    "updatedAt" : "2016-05-01T22:54:08.255Z",
    "deletedAt" : null,
    "image" : ""
  },
  "memberIds" : [
    101,
    102,
    103,
    104
  ],
  "memberCount" : 4,
  "slotCount" : 0,
  "membershipState" : "active"
}
```
