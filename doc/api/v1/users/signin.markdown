# Users API

## Signin

### POST /v1/users/signin

returns OK and an AuthToken if credentials match

returns 401 if credentials invalid

### Parameters

Name : email *- required -*
Description : Email of the user to authenticate

Name : password *- required -*
Description : Password for the user to authenticate


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
  "email" : "user151@email.com",
  "password" : "timeslot"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/signin&quot; -d &#39;{&quot;email&quot;:&quot;user151@email.com&quot;,&quot;password&quot;:&quot;timeslot&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;31f95028fa95986e9421b9c1ce61f49f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5b14891e-d192-4fe4-bd77-18fc186a19f1
X-Runtime: 0.015903
Content-Length: 908</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 106,
  "username" : "User 822",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:51:10.843Z",
  "updatedAt" : "2016-08-30T09:51:10.843Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : null,
  "email" : "user151@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "48e0eeb4-d1e4-456f-ac1d-f7e2209070b5",
  "friendsCalendarUuid" : "0ee3e5aa-c2a5-45c1-8a6a-becf0780f234",
  "allMySlotsUuid" : "db6ea431-498d-4066-b003-eba3e3d96e30",
  "myCreatedSlotsUuid" : "7f05da4c-4096-47fd-b51a-6425b2860455",
  "myPrivateSlotsUuid" : "b849f6bd-5f8e-4179-8d7a-acce71a1e512",
  "myFriendSlotsUuid" : "a9f20ab1-c073-4b44-8c9c-d6f1a623070e",
  "myPublicSlotsUuid" : "cfbbbc4a-011f-4290-8484-14aca9f26a25",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "0XCXheirQ32RHiLO5lzlYDo3UrQ"
}
```
