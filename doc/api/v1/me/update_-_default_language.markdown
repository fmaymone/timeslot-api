# Me API

## Update - default language

### PATCH /v1/me

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
Authorization: Token token=iQRHuVb136lOH79Ouj3cPnPQEY4
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/me</pre>

#### Body
```javascript
{
  "lang" : "de"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -d &#39;{&quot;lang&quot;:&quot;de&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=iQRHuVb136lOH79Ouj3cPnPQEY4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;b97a8ad84df55120929b01468cc6c287&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3e092cdc-4f5d-4ddb-8eae-b08daaa137ac
X-Runtime: 0.039109
Content-Length: 864</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 78,
  "username" : "User 619",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:54.668Z",
  "updatedAt" : "2016-08-30T09:50:54.686Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : "de",
  "email" : "user79@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "190e1270-f67c-4509-9a26-121e2ab8448f",
  "friendsCalendarUuid" : "16daa613-2055-494b-b4e4-c6d9d8c6c9e2",
  "allMySlotsUuid" : "93b0983d-852d-4a3d-bbc2-a9f58d18e977",
  "myCreatedSlotsUuid" : "b8bf98cf-badf-4034-b799-65971bf843cb",
  "myPrivateSlotsUuid" : "d0bbead3-3370-44b0-8a9d-7c6a050da448",
  "myFriendSlotsUuid" : "b1961400-5995-47ff-83ce-4ddd17656ffa",
  "myPublicSlotsUuid" : "0075bf7e-ffff-4122-90fc-944bb167458b",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
