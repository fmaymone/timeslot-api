# Users API

## User signin with an existing device

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
  "email" : "user82@email.com",
  "password" : "timeslot",
  "device" : {
    "device" : {
      "device_id" : "sn-6346287341083478676543956",
      "system" : "ios",
      "version" : "6.0"
    }
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/signin&quot; -d &#39;{&quot;email&quot;:&quot;user82@email.com&quot;,&quot;password&quot;:&quot;timeslot&quot;,&quot;device&quot;:{&quot;device&quot;:{&quot;device_id&quot;:&quot;sn-6346287341083478676543956&quot;,&quot;system&quot;:&quot;ios&quot;,&quot;version&quot;:&quot;6.0&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ecad1ffd9d1c21e5743a687646dc294a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 652835cd-ea8b-4618-9d97-8239548afded
X-Runtime: 0.102132
Vary: Origin
Content-Length: 786</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 325,
  "username" : "User 289",
  "createdAt" : "2015-09-14T10:33:00.133Z",
  "updatedAt" : "2015-09-14T10:33:00.214Z",
  "deletedAt" : null,
  "location" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user82@email.com",
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
  "authToken" : "pZ6-_KacYwlB8j4um3vLVL5ui3s"
}
```
