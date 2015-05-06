# Groups API

## Delete group

### DELETE /v1/groups/:group_id

Sets &#39;deleted_at&#39; on the group and its memberships. Doesn&#39;t delete anything.

Current User must be group ownerreturns 200 and the updated data for the group

returns 403 if current user not group owner

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to delete

### Request

#### Headers

<pre>Authorization: Token token=b2zJi9ViXCUXOyyMrwVNf9_NUZQ
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/groups/16</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/16&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=b2zJi9ViXCUXOyyMrwVNf9_NUZQ&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;554291ff9b15ad8e07eb898eb43f6788&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 70085111-19b2-409c-97e4-be2e60f3a584
X-Runtime: 0.057648
Content-Length: 250</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 16,
  "name" : "Testgroup 13",
  "ownerId" : 55,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-06T11:28:49.528Z",
  "updatedAt" : "2015-05-06T11:28:49.601Z",
  "deletedAt" : "2015-05-06T11:28:49.600Z",
  "image" : null,
  "membershipState" : "deleted"
}</pre>
