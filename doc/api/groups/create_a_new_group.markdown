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
Authorization: Token token=BKHg-S6Iuszy5bqKGVC93toqC94
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body

<pre>{"name":"foo","invitees":[49,50,51]}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;invitees&quot;:[49,50,51]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=BKHg-S6Iuszy5bqKGVC93toqC94&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;327000c1d5ce3ade5455e7de118a2a3e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: df977917-0000-46ca-bc55-c3af661463e1
X-Runtime: 0.033237
Content-Length: 217</pre>

#### Status

<pre>201 Created</pre>

#### Body

<pre>{
  "id" : 13,
  "name" : "foo",
  "ownerId" : 52,
  "membersCanPost" : true,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-06T11:28:49.429Z",
  "updatedAt" : "2015-05-06T11:28:49.429Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}</pre>
