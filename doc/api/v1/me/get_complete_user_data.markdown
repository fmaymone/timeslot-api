# Me API

## Get complete User data

### GET /v1/me

shows all User data.

### Parameters

Name : username
Description : Updated username of user (max. 50 characters)

Name : firstName
Description : Updated firstname of user (max. 50 characters)

Name : middleName
Description : Updated middlename of user (max. 50 characters)

Name : lastName
Description : Updated lastname of user (max. 50 characters)

Name : gender
Description : Updated gender of user (max. 50 characters)

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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=TkkB19HhZyLEO27u2Y3TKMTGyjI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=TkkB19HhZyLEO27u2Y3TKMTGyjI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;1ad0580bad2a38af4944877fb0f1933d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e7cf3882-87db-4d30-a8a4-4bd5c0995702
X-Runtime: 0.039485
Content-Length: 1598</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 7,
  "username" : "User 542",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:53.169Z",
  "updatedAt" : "2016-08-30T09:50:53.281Z",
  "deletedAt" : null,
  "image" : "www.looking.good",
  "location" : {
    "id" : "6190f717-d0e2-4dbb-a277-4ca2cc6fcc67",
    "name" : "Acapulco",
    "thoroughfare" : null,
    "subThoroughfare" : null,
    "locality" : null,
    "subLocality" : null,
    "administrativeArea" : null,
    "subAdministrativeArea" : null,
    "postalCode" : null,
    "country" : null,
    "isoCountryCode" : null,
    "inLandWater" : null,
    "ocean" : null,
    "areasOfInterest" : null,
    "latitude" : 51.234,
    "longitude" : -11.993,
    "placeId" : null
  },
  "slotCount" : 2,
  "calendarCount" : 0,
  "friendsCount" : 3,
  "gender" : null,
  "lang" : null,
  "email" : "user62@email.com",
  "emailVerified" : false,
  "phone" : "12431",
  "phoneVerified" : false,
  "publicUrl" : "www.foo.bar",
  "push" : true,
  "myCalendarUuid" : "3eacc15c-0b86-4ff9-a5c8-65ff7fb7b7c7",
  "friendsCalendarUuid" : "f7fb8e68-f0b5-43e9-83ee-0f48db045671",
  "allMySlotsUuid" : "780a5b88-4490-4adb-8c30-d5a95d3c66eb",
  "myCreatedSlotsUuid" : "0b969e60-9742-410d-bdd6-eb92640b7d82",
  "myPrivateSlotsUuid" : "c5cd443c-d046-415c-b589-4857b3706d60",
  "myFriendSlotsUuid" : "94d7f1a2-5b48-4032-a0fe-cd4ff0551099",
  "myPublicSlotsUuid" : "68fbe440-857c-4bc8-9fc8-c39d0313e2f1",
  "friendships" : [
    {
      "friend_id" : 10,
      "state" : "friend",
      "initiator" : 7
    },
    {
      "friend_id" : 11,
      "state" : "friend",
      "initiator" : 7
    },
    {
      "friend_id" : 12,
      "state" : "friend",
      "initiator" : 7
    }
  ],
  "memberships" : [
    {
      "groupId" : 1,
      "state" : "invited",
      "color" : "000000",
      "notifications" : true
    },
    {
      "groupId" : 2,
      "state" : "invited",
      "color" : "000000",
      "notifications" : true
    },
    {
      "groupId" : 3,
      "state" : "invited",
      "color" : "000000",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself"
}
```
