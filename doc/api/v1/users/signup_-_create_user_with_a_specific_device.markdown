# Users API

## Signup - Create user with a specific device

### POST /v1/users

Either an email or phone number must be provided

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : username *- required -*
Description : Username of user (3-50 characters)

Name : firstName
Description : First name of user (2-50 characters)

Name : middleName
Description : Middle name of user (2-50 characters)

Name : lastName
Description : Last name of user (2-50 characters)

Name : gender
Description : Gender of the user (male, female, other)

Name : email
Description : Email of user (max. 254 characters)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : lang
Description : Language of user (2 characters, ISO 639-1)

Name : password *- required -*
Description : Password for user (min. 5 &amp; max. 72 characters)

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

<pre>POST /v1/users</pre>

#### Body
```javascript
{
  "username" : "foo",
  "firstName" : "Lana",
  "middleName" : "Del",
  "lastName" : "Rey",
  "gender" : "female",
  "email" : "someone@timeslot.com",
  "lang" : "de",
  "password" : "secret-thing",
  "device" : {
    "device" : {
      "device_id" : "sn-333462873410834786765439533",
      "system" : "ios",
      "version" : "6.0"
    }
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users&quot; -d &#39;{&quot;username&quot;:&quot;foo&quot;,&quot;firstName&quot;:&quot;Lana&quot;,&quot;middleName&quot;:&quot;Del&quot;,&quot;lastName&quot;:&quot;Rey&quot;,&quot;gender&quot;:&quot;female&quot;,&quot;email&quot;:&quot;someone@timeslot.com&quot;,&quot;lang&quot;:&quot;de&quot;,&quot;password&quot;:&quot;secret-thing&quot;,&quot;device&quot;:{&quot;device&quot;:{&quot;device_id&quot;:&quot;sn-333462873410834786765439533&quot;,&quot;system&quot;:&quot;ios&quot;,&quot;version&quot;:&quot;6.0&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;07829b77656d0f6e44a57fbc45c9650f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 77a16881-cb23-4704-9b52-638e4df83344
X-Runtime: 0.046908
Content-Length: 1053</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 103,
  "username" : "foo",
  "firstName" : "Lana",
  "middleName" : "Del",
  "lastName" : "Rey",
  "createdAt" : "2016-12-11T19:54:40.291Z",
  "updatedAt" : "2016-12-11T19:54:40.291Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 2,
  "friendsCount" : 0,
  "gender" : "female",
  "lang" : "de",
  "email" : "someone@timeslot.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "a90d6a82-1a54-4d30-a376-687f12c7e7ba",
  "friendsCalendarUuid" : "e9e5420f-8196-4b93-ae49-0a88930b1afd",
  "allMySlotsUuid" : "6951c2ba-679b-4065-aeb8-d38b6c5b86fd",
  "myCreatedSlotsUuid" : "749c82d3-4981-4d95-9b8f-1b51b92b5d27",
  "myPrivateSlotsUuid" : "f23fbd87-2130-4699-9f36-6c1c9b7ad7c1",
  "myFriendSlotsUuid" : "f98b51a8-d66e-4371-9586-555429cce569",
  "myPublicSlotsUuid" : "71ce4d86-b407-40d9-a7f2-f0f13f995fa5",
  "friendships" : [],
  "memberships" : [
    {
      "groupId" : 31,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    },
    {
      "groupId" : 32,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself",
  "authToken" : "Ggtcn4Yr-V20ntIvRyLbtts8hNE"
}
```
