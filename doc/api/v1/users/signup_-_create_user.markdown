# Users API

## Signup - Create user

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
  "password" : "secret-thing"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users&quot; -d &#39;{&quot;username&quot;:&quot;foo&quot;,&quot;firstName&quot;:&quot;Lana&quot;,&quot;middleName&quot;:&quot;Del&quot;,&quot;lastName&quot;:&quot;Rey&quot;,&quot;gender&quot;:&quot;female&quot;,&quot;email&quot;:&quot;someone@timeslot.com&quot;,&quot;lang&quot;:&quot;de&quot;,&quot;password&quot;:&quot;secret-thing&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;8b2e15e9ec5b2dc6bedbd74a9dc1903f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4f492345-2acd-4e9d-8ed3-f3462bdade5d
X-Runtime: 0.042363
Content-Length: 1053</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 102,
  "username" : "foo",
  "firstName" : "Lana",
  "middleName" : "Del",
  "lastName" : "Rey",
  "createdAt" : "2016-12-11T19:54:40.242Z",
  "updatedAt" : "2016-12-11T19:54:40.242Z",
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
  "myCalendarUuid" : "661b6f70-1b84-473f-a69d-4ed88d7930f3",
  "friendsCalendarUuid" : "ddeaea8b-59cd-4ea1-8d9f-68608e762ef2",
  "allMySlotsUuid" : "f1e0012a-b4b2-4e0c-97ca-2fd93b370354",
  "myCreatedSlotsUuid" : "250f2001-bba2-4dcf-a467-8debd99ac104",
  "myPrivateSlotsUuid" : "45c5ddd1-c2d4-430a-a80c-184746c2eb46",
  "myFriendSlotsUuid" : "e37da4e7-5ee9-4149-876b-4e1dcd09e697",
  "myPublicSlotsUuid" : "d4eac7ac-fad1-458b-a561-846adac29802",
  "friendships" : [],
  "memberships" : [
    {
      "groupId" : 29,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    },
    {
      "groupId" : 30,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself",
  "authToken" : "wPqqr3nFoTbrBaXQ0_wE2XRtzD8"
}
```
