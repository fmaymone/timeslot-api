# Users API

## Signin with new device

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

Name : system *- required -*
Description : A string shorthand of the current device operating system (max. 10 chars), e.g.: &#39;ios&#39;, &#39;android&#39; 

Name : version *- required -*
Description : A string for the version of the current device operating system (max. 10 chars), e.g.: &#39;6.0b&#39; 

Name : deviceId *- required -*
Description : A unique hardware ID from the current device (max. 128 chars)


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : firstName
Description : First name of the user

Name : middleName
Description : Middle name of the user

Name : lastName
Description : Last name of the user

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

Name : gender
Description : Gender of user (non-binary to allow transgender types)

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
  "email" : "user152@email.com",
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

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/signin&quot; -d &#39;{&quot;email&quot;:&quot;user152@email.com&quot;,&quot;password&quot;:&quot;timeslot&quot;,&quot;device&quot;:{&quot;device&quot;:{&quot;device_id&quot;:&quot;sn-353462873410834786765439535&quot;,&quot;system&quot;:&quot;ios&quot;,&quot;version&quot;:&quot;6.0&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c5c14d586d5faf133efc74dcc3c54e2f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d0b054a9-f551-463b-a830-160142b17e24
X-Runtime: 0.032910
Content-Length: 908</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 107,
  "username" : "User 823",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:51:10.870Z",
  "updatedAt" : "2016-08-30T09:51:10.870Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : null,
  "email" : "user152@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "8278e4b9-a7e8-48a7-a236-cfdc74e39122",
  "friendsCalendarUuid" : "839c07b2-661f-4e96-af8c-ce9df0168065",
  "allMySlotsUuid" : "55e6bc2b-6b73-4880-bade-21ba1de2739d",
  "myCreatedSlotsUuid" : "13b89d8d-6a09-473f-a1f9-084a5fdad972",
  "myPrivateSlotsUuid" : "f76039d0-c94d-415c-841b-38adcab5a6d2",
  "myFriendSlotsUuid" : "c9e83120-79c7-413f-9e92-21fb56e4f87a",
  "myPublicSlotsUuid" : "5691ddb7-06da-48e2-b32c-0dc2bba59368",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "kfcQ9y8MSX6UWc9kBz4_uZLQEzM"
}
```
