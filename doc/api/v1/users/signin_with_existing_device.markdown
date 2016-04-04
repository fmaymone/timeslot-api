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

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : slotCount
Description : Number of visible slots for this user

Name : calendarCount
Description : Number of visible calendars for this user

Name : friendsCount
Description : Number of friends for this user

Name : lang
Description : Language code (ISO 639-1)

Name : email
Description : Email of user (max. 255 characters)

Name : email_verified
Description : User has confirmed Email (true/false)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : phone_verified
Description : User has confirmed phone number (true/false)

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

Name : all_my_slots_uuid
Description : UUID to retrive all slots related to the user. (Needs further specification)

Name : my_calendar_uuid
Description : UUID to get/add or remove slots of the  users &#39;MyCalendar&#39;.

Name : friend_slots_uuid
Description : UUID for friend-visible slots of the user

Name : public_slots_uuid
Description : UUID for public slots of the current user

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
  "email" : "user119@email.com",
  "password" : "timeslot",
  "device" : {
    "device" : {
      "device_id" : "sn-353462873410834786765439535",
      "system" : "ios",
      "version" : "6.0"
    }
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/signin&quot; -d &#39;{&quot;email&quot;:&quot;user119@email.com&quot;,&quot;password&quot;:&quot;timeslot&quot;,&quot;device&quot;:{&quot;device&quot;:{&quot;device_id&quot;:&quot;sn-353462873410834786765439535&quot;,&quot;system&quot;:&quot;ios&quot;,&quot;version&quot;:&quot;6.0&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ea13913024a63c392a85aefde6b484a9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2648cd15-0e61-42bc-8792-155d8c455669
X-Runtime: 0.019445
Vary: Origin
Content-Length: 783</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 122,
  "username" : "User 422",
  "createdAt" : "2016-04-04T20:50:33.477Z",
  "updatedAt" : "2016-04-04T20:50:33.477Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user119@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "e58df9ad-3aa2-496e-92de-a07b6df5b858",
  "friendsCalendarUuid" : "f01c0e07-b891-4958-aef0-5c55f9a54e22",
  "allMySlotsUuid" : "63409144-261c-45d6-ace0-a9379f2376ba",
  "myCreatedSlotsUuid" : "b35542fd-3c3f-44c4-9781-ae7e912eb1ea",
  "myFriendSlotsUuid" : "210b962c-df67-4bdd-9842-60bbeedf7f4b",
  "myPublicSlotsUuid" : "e3244aba-3c71-4f35-b35d-a66b7db1b41a",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "bAb8Sh76AY0TQ98TTTxRmGrIusw"
}
```
