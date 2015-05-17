# Users API

## Delete current user

### DELETE /v1/users

Sets &#39;deletedAt&#39; attr for user who is logged inDoesn&#39;t delete anything.

returns user data
### Request

#### Headers

<pre>Authorization: Token token=KN76ucFEp4wnWrdQTA2-1Q3Exvs
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/users</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=KN76ucFEp4wnWrdQTA2-1Q3Exvs&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;cedd5f1d40b13cfc4a9a37e462ec0596&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a41429ac-18b2-4898-8d32-54146562398a
X-Runtime: 0.033125
Content-Length: 723</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
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
  "createdAt" : "2015-05-06T21:29:39.770Z",
  "updatedAt" : "2015-05-06T21:29:39.783Z",
  "deletedAt" : "2015-05-06T21:29:39.781Z",
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendships" : [],
  "groups" : []
}
```
