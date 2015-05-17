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
Authorization: Token token=9vLkPHBuCETYnVw0BOqq-swmVfQ
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/14</pre>

#### Body
```javascript
{
  "name" : "bar",
  "membersCanInvite" : true,
  "membersCanPost" : true
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/14&quot; -d &#39;{&quot;name&quot;:&quot;bar&quot;,&quot;membersCanInvite&quot;:true,&quot;membersCanPost&quot;:true}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=9vLkPHBuCETYnVw0BOqq-swmVfQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;c7cc0a81233fd1d118ea5b63603c5912&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5d3ea3eb-f59b-4ef4-8a12-fdbab94d6a49
X-Runtime: 0.012853
Content-Length: 216</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 14,
  "name" : "bar",
  "ownerId" : 53,
  "membersCanPost" : true,
  "membersCanInvite" : true,
  "createdAt" : "2015-05-06T21:29:29.433Z",
  "updatedAt" : "2015-05-06T21:29:29.446Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}
```
