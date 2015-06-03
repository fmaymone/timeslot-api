# Users API

## Delete current user

### DELETE /v1/users

Sets &#39;deletedAt&#39; attr for user who is logged inDoesn&#39;t delete anything.

returns user data

### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

Name : email
Description : Email of user (max. 255 characters)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : publicUrl
Description : Public URL for user on Timeslot (max. 255 chars)

Name : slotDefaultDuration
Description : Default Slot Duration in seconds

Name : slotDefaultTypeId
Description : Default Slot Type - WIP

Name : slotDefaultLocationId
Description : Default Slot Location ID - WIP

Name : defaultPrivateAlerts
Description : Default alerts for private slots of this user

Name : defaultOwnFriendslotAlerts
Description : Default alerts for the friendslots of this user

Name : defaultOwnPublicAlerts
Description : Default alerts for the public slots of this user

Name : defaultFriendsFriendslotAlerts
Description : Default alerts for the friendslots from friends of this user

Name : defaultFriendsPublicAlerts
Description : Default alerts for the public slots from friends of this user

Name : defaultReslotAlerts
Description : Default alerts for the reslots of this user

Name : defaultGroupAlerts
Description : Default alerts for all groupslots of this user where no specific alert is set. Groupslots may also have their own default alerts per group

Name : friendships
Description : all connections to other users

Name : memberships
Description : all connections to groups

### Request

#### Headers

<pre>Authorization: Token token=kBX970neDA60XV2m2fieZ8zTQ6o
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/users</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=kBX970neDA60XV2m2fieZ8zTQ6o&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1e435e81aed45dd494a0cf0cb00aa25a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3bd2334b-1134-4e8d-9f90-d7353248eadc
X-Runtime: 0.030731
Content-Length: 714</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 286,
  "username" : "User 282",
  "createdAt" : "2015-06-03T10:39:40.507Z",
  "updatedAt" : "2015-06-03T10:39:40.518Z",
  "deletedAt" : "2015-06-03T10:39:40.516Z",
  "location" : null,
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "email" : "user69@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
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
  "friendships" : [],
  "memberships" : []
}
```
