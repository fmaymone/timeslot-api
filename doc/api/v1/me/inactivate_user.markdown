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

<pre>Authorization: Token token=o5eXiRcnZIFD81Ym9jDJ5vvs_CU
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Authorization: Token token=o5eXiRcnZIFD81Ym9jDJ5vvs_CU&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;27b31296465eab8c9c96f939337e624f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 89b08a0c-498e-4ea5-999b-018dc53dd734
X-Runtime: 0.053350
Vary: Origin
Content-Length: 761</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 81,
  "username" : "User 243",
  "createdAt" : "2016-04-04T20:50:25.020Z",
  "updatedAt" : "2016-04-04T20:50:25.054Z",
  "deletedAt" : "2016-04-04T20:50:25.052Z",
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user52@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "c56808c7-1125-4b2d-9f29-95ca26cf604f",
  "friendsCalendarUuid" : "c68525da-8ebb-49ae-a2ca-f26badff7671",
  "allMySlotsUuid" : "53af6253-69bf-4ce9-9d46-36c4df95170c",
  "myCreatedSlotsUuid" : "3861217a-9b58-4f11-ae84-41ade7238aa3",
  "myFriendSlotsUuid" : "250908de-98ae-4699-8239-fff696d1fbe9",
  "myPublicSlotsUuid" : "ff417768-5971-4f75-bd71-634894f7d88b",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
