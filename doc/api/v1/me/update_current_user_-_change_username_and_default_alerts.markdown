# Me API

## Update current user - change username and default alerts

### PATCH /v1/me

E.g, change username and set default alerts

returns user data

returns 404 if ID is invalid

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : username
Description : Updated username of user (max. 50 characters)

Name : email
Description : Email of user (max. 255 characters)

Name : lang
Description : Language of user (2 characters, ISO 639-1)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : image
Description : URL of the user image

Name : publicUrl
Description : Public URL for user on Timeslot (max. 255 chars)

Name : push
Description : Send push Notifications (true/false)

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


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : push
Description : Send push Notifications (true/false)

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

Name : lang
Description : Language code (ISO 639-1)

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

Name : devices
Description : all devices from user

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=Y93xa9Aja91Aasd8e-iFy7vdzGI
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/me</pre>

#### Body
```javascript
{
  "username" : "bar",
  "defaultPrivateAlerts" : "0111011100"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me&quot; -d &#39;{&quot;username&quot;:&quot;bar&quot;,&quot;defaultPrivateAlerts&quot;:&quot;0111011100&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Y93xa9Aja91Aasd8e-iFy7vdzGI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;9cc227dc7d05563df96e5789f1863072&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e213a4e4-265a-42df-9aad-443207cbd38f
X-Runtime: 0.036540
Vary: Origin
Content-Length: 709</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 100,
  "username" : "bar",
  "createdAt" : "2015-11-17T12:12:37.460Z",
  "updatedAt" : "2015-11-17T12:12:37.478Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user34@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "slotDefaultDuration" : null,
  "slotDefaultLocationId" : null,
  "slotDefaultTypeId" : null,
  "defaultPrivateAlerts" : "0111011100",
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
