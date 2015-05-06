# Users API

## Delete current user

### DELETE /v1/users

Sets &#39;deletedAt&#39; attr for user who is logged inDoesn&#39;t delete anything.

returns user data
### Request

#### Headers

<pre>Authorization: Token token=wwZjOkdNt92BIoc2_uwWStKN6ig
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/users</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=wwZjOkdNt92BIoc2_uwWStKN6ig&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;d6011a3a04a3f6d4ffc6bbb9594f235b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 73c6c828-eb20-4abe-9e8b-371fdccc828a
X-Runtime: 0.028174
Content-Length: 723</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 218,
  "username" : "User 217",
  "email" : "user61@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "locationId" : null,
  "slotDefaultDuration" : null,
  "slotDefaultLocationId" : null,
  "slotDefaultTypeId" : null,
  "defaultPrivateAlerts" : "0000000000",
  "defaultOwnFriendslotAlerts" : "0000000000",
  "defaultOwnPublicAlerts" : "0000000000",
  "defaultFriendsFriendslotAlerts" : "0000000000",
  "defaultFriendsPublicAlerts" : "0000000000",
  "defaultReslotAlerts" : "0000000000",
  "defaultGroupAlerts" : "0000000000",
  "push" : true,
  "createdAt" : "2015-05-06T14:45:17.450Z",
  "updatedAt" : "2015-05-06T14:45:17.460Z",
  "deletedAt" : "2015-05-06T14:45:17.458Z",
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendships" : [],
  "groups" : []
}</pre>
