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
Description : ID of the new group

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=GDe1wPox43kcy76DshVOBOzxto8
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "invitees" : [
    49,
    50,
    51
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;invitees&quot;:[49,50,51]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=GDe1wPox43kcy76DshVOBOzxto8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;5ded71132010646a134f0631cadafab0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c77a0eb4-610c-450a-abd1-0ad3063263aa
X-Runtime: 0.033635
Content-Length: 217</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 13,
  "name" : "foo",
  "ownerId" : 52,
  "membersCanPost" : true,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-06T21:29:29.314Z",
  "updatedAt" : "2015-05-06T21:29:29.314Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}
```
