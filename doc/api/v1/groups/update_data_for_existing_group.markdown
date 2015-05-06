# Groups API

## Update data for existing group

### PATCH /v1/groups/:group_id

e.g. Change groupname

returns 200 if the update was successful

returns 404 if ID is invalid

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to update

Name : name
Description : Updated name of group (max. 255 characters)

Name : membersCanInvite
Description : Allows members to invite other users

Name : membersCanPost
Description : Allows members to post new slots

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=3F_0iBqIv77dusOG7GB_ZYyAvMg
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/14</pre>

#### Body

<pre>{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/14&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=3F_0iBqIv77dusOG7GB_ZYyAvMg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;d728952a5aa8f6eb324f635f93416c06&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d21a62b8-3e91-429b-b850-e1aabef7ebb4
X-Runtime: 0.008758
Content-Length: 216</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 14,
  "name" : "bar",
  "ownerId" : 53,
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2015-05-06T14:45:14.983Z",
  "updatedAt" : "2015-05-06T14:45:14.991Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}</pre>
