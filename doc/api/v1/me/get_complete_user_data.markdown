# Me API

## Get complete User data

### GET /v1/me

shows all User data.

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

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=0y_TLoL8jNI4dS_46ZDasnaC3JA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=0y_TLoL8jNI4dS_46ZDasnaC3JA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;40e64ec73e0b4df2af2461d7248e7b3b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ef3466d3-13b2-4748-9407-e06e98ad8532
X-Runtime: 0.036877
Vary: Origin
Content-Length: 1404</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 2,
  "username" : "User 163",
  "createdAt" : "2016-04-04T20:50:23.608Z",
  "updatedAt" : "2016-04-04T20:50:23.697Z",
  "deletedAt" : null,
  "image" : "www.looking.good",
  "location" : {
    "id" : "722e3bda-61f4-4e64-880f-171b4c14d2e5",
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
    "longitude" : -11.993
  },
  "slotCount" : 2,
  "calendarCount" : 0,
  "friendsCount" : 3,
  "lang" : null,
  "email" : "user32@email.com",
  "emailVerified" : false,
  "phone" : "12431",
  "phoneVerified" : false,
  "publicUrl" : "www.foo.bar",
  "push" : true,
  "myCalendarUuid" : "e610eb8e-09a6-4278-b592-7e32e12ca98f",
  "friendsCalendarUuid" : "69b100bf-1f49-4712-8eea-71c54c1d8cae",
  "allMySlotsUuid" : "7bbf821e-2cc5-45a4-a0a4-60875105ab4a",
  "myCreatedSlotsUuid" : "92514a48-1edb-4519-b479-880643a8dc6a",
  "myFriendSlotsUuid" : "ca814e4c-f2d2-4135-8227-db8fc888a4cb",
  "myPublicSlotsUuid" : "fc5ac279-7c18-4ae7-9a55-5e967f6a6540",
  "friendships" : [
    {
      "friend_id" : 5,
      "state" : "friend",
      "initiator" : 2
    },
    {
      "friend_id" : 6,
      "state" : "friend",
      "initiator" : 2
    },
    {
      "friend_id" : 7,
      "state" : "friend",
      "initiator" : 2
    }
  ],
  "memberships" : [
    {
      "groupId" : 1,
      "state" : "invited",
      "notifications" : true
    },
    {
      "groupId" : 2,
      "state" : "invited",
      "notifications" : true
    },
    {
      "groupId" : 3,
      "state" : "invited",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself"
}
```
