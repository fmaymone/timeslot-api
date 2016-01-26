# Users API

## Signin with existing device

### POST /v1/users/signin

returns OK and an AuthToken if credentials match

returns 401 if credentials invalid

### Parameters

Name : email *- required -*
Description : Email of the user to authenticate

Name : password *- required -*
Description : Password for the user to authenticate

Name : device *- required -*
Description : A key-value-paired array which describes the device, e.g. device = { system: &#39;ios&#39;, version: &#39;6.0b&#39;, deviceId: &#39;xxx-xxxx-xxx&#39; }

Name : deviceId *- required -*
Description : A unique hardware ID from the current device (max. 128 chars)


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

Name : authToken
Description : Authentication Token for the user to be set as a HTTP header in subsequent requests

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/signin</pre>

#### Body
```javascript
{
  "email" : "user106@email.com",
  "password" : "timeslot",
  "device" : {
    "device" : {
      "device_id" : "sn-293462873410834786765439529",
      "system" : "ios",
      "version" : "6.0"
    }
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/signin&quot; -d &#39;{&quot;email&quot;:&quot;user106@email.com&quot;,&quot;password&quot;:&quot;timeslot&quot;,&quot;device&quot;:{&quot;device&quot;:{&quot;device_id&quot;:&quot;sn-293462873410834786765439529&quot;,&quot;system&quot;:&quot;ios&quot;,&quot;version&quot;:&quot;6.0&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a153d821b26cca55ed7f2f1f12f21dd4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3deba8d3-910b-43bf-ba0c-d0419e2e99ef
X-Runtime: 0.025857
Vary: Origin
Content-Length: 757</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 118,
  "username" : "User 419",
  "createdAt" : "2016-01-21T23:11:42.693Z",
  "updatedAt" : "2016-01-21T23:11:42.693Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user106@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
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
  "memberships" : [],
  "authToken" : "dTtR0mFzQ6_bAkqHqnskxVOW7qQ"
}
```
