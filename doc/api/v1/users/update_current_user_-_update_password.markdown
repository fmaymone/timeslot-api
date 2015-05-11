# Users API

## Update current user - update password

### PATCH /v1/users

The valid old password needs to be send along

returns 200 and the users data if the password was successfully updated

### Parameters

Name : password *- required -*
Description : new password

Name : old_password *- required -*
Description : valid old password

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=R9Q1RnZsuZzYe56MAetZsAhESFk
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body
```javascript
{
  "password" : "slimetot",
  "old_password" : "timeslot"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;{&quot;password&quot;:&quot;slimetot&quot;,&quot;old_password&quot;:&quot;timeslot&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=R9Q1RnZsuZzYe56MAetZsAhESFk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;9f5ed58e88fc16999205b0ec03147f83&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: dff6e3cc-a2c0-4e14-956b-a4bb8c25ec58
X-Runtime: 0.019827
Content-Length: 694</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 229,
  "username" : "User 225",
  "email" : "user64@email.com",
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
  "createdAt" : "2015-05-11T14:48:23.631Z",
  "updatedAt" : "2015-05-11T14:48:23.643Z",
  "deletedAt" : null,
  "friendships" : [],
  "memberships" : [],
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0
}
```
