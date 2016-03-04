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
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

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
Authorization: Token token=xUtXJ3CayPltvInOJXpytCr4jzI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=xUtXJ3CayPltvInOJXpytCr4jzI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3b22861a03b78d9829d45067a18a6723&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 9377a49e-eadc-43c2-8fd4-511250549a7d
X-Runtime: 0.037512
Vary: Origin
Content-Length: 1386</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 2,
  "username" : "User 145",
  "createdAt" : "2016-03-03T13:47:57.248Z",
  "updatedAt" : "2016-03-03T13:47:57.340Z",
  "deletedAt" : null,
  "image" : "www.looking.good",
  "location" : {
    "id" : "616f65bd-a43b-4adc-975a-e2134847df31",
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
  "friendsCount" : 3,
  "lang" : null,
  "email" : "user30@email.com",
  "emailVerified" : false,
  "phone" : "12431",
  "phoneVerified" : false,
  "publicUrl" : "www.foo.bar",
  "push" : true,
  "myCalendarUuid" : "e7af96af-d149-47fe-b9d3-b005e5a4092f",
  "friendsCalendarUuid" : "128e6e06-eedb-436e-8541-c6def82c93c8",
  "allMySlotsUuid" : "e13ea14e-7284-4ee7-b0f5-ff8aa7d04684",
  "myCreatedSlotsUuid" : "c9434a76-0ef7-42e6-91b8-a8907ee1e584",
  "myFriendSlotsUuid" : "c668da8d-ea5d-4007-8acc-c0d0d2ef8537",
  "myPublicSlotsUuid" : "c86c9db1-d7c2-42fa-a3e5-da2272807aea",
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
