# Me API

## Inactivate User

### DELETE /v1/me

Sets &#39;deletedAt&#39; attr for user who is logged inDoesn&#39;t delete anything.

returns user data

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

<pre>Authorization: Token token=7vEdL68Jq_or8uXtlEoxbkEnJAw
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=7vEdL68Jq_or8uXtlEoxbkEnJAw&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;0fcad70b84c108c043d1b5f2c3534b67&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: f4e37076-844b-4e79-a1c3-0d0553a68462
X-Runtime: 0.061355
Content-Length: 886</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 81,
  "username" : "User 622",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:54.784Z",
  "updatedAt" : "2016-08-30T09:50:54.821Z",
  "deletedAt" : "2016-08-30T09:50:54.819Z",
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : null,
  "email" : "user82@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "1877dbac-0928-45af-b335-a19b7d9a9980",
  "friendsCalendarUuid" : "8c245d4a-5752-4c0b-82b6-45e5a1e65c75",
  "allMySlotsUuid" : "caf3a164-7ae9-42d6-a766-9b619ae23a08",
  "myCreatedSlotsUuid" : "a75a0db6-f754-4d0b-a7dc-b0ba3bee6e5f",
  "myPrivateSlotsUuid" : "eb19d817-a375-460b-9ecc-68b867d8e2fe",
  "myFriendSlotsUuid" : "8c027ca7-219a-451c-8010-72fbaaa0ab6b",
  "myPublicSlotsUuid" : "60dbd459-990e-4371-8d82-89a441e61c2d",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
