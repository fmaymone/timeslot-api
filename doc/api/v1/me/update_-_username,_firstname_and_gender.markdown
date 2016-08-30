# Me API

## Update - username, firstname and gender

### PATCH /v1/me

E.g, change username and set default alerts

returns user data

returns 404 if ID is invalid

returns 422 if parameters are missing

returns 422 if parameters are invalid

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

<pre>Content-Type: application/json
Authorization: Token token=PeKVWNel6qbPifje8k_31eN1-5A
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/me</pre>

#### Body
```javascript
{
  "username" : "bar",
  "firstName" : "Barack",
  "gender" : "male"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -d &#39;{&quot;username&quot;:&quot;bar&quot;,&quot;firstName&quot;:&quot;Barack&quot;,&quot;gender&quot;:&quot;male&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=PeKVWNel6qbPifje8k_31eN1-5A&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;63131f3ec68ba83506b4e3d35ec29731&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b775f13d-86d6-4b87-8662-1652b2a77dd9
X-Runtime: 0.022901
Content-Length: 865</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 74,
  "username" : "bar",
  "firstName" : "Barack",
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:54.481Z",
  "updatedAt" : "2016-08-30T09:50:54.493Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : "male",
  "lang" : null,
  "email" : "user75@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "74cdb19a-54a8-4af6-b441-3f0cc20c96bf",
  "friendsCalendarUuid" : "d9464e25-a2f7-4a24-87a2-60ca1d56e44f",
  "allMySlotsUuid" : "7537f9f8-6d30-47ae-8cc3-0ed9b663e591",
  "myCreatedSlotsUuid" : "d4220658-2bbc-4206-a058-6463a9b6e5c0",
  "myPrivateSlotsUuid" : "ed18f48e-98e2-4d46-8306-0f30d1b23ebd",
  "myFriendSlotsUuid" : "1f627d0e-dcd6-4c30-bce0-05d90f15a89c",
  "myPublicSlotsUuid" : "e71610b1-208a-47fe-968b-0c3cb434e6ca",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
