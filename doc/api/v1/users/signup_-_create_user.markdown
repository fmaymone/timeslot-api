# Users API

## Signup - Create user

### POST /v1/users

Either an email or phone number must be provided

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : username *- required -*
Description : Username of user (max. 50 characters)

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
  "email" : "someone@timeslot.com",
  "lang" : "de",
  "password" : "secret-thing"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users&quot; -d &#39;{&quot;username&quot;:&quot;foo&quot;,&quot;email&quot;:&quot;someone@timeslot.com&quot;,&quot;lang&quot;:&quot;de&quot;,&quot;password&quot;:&quot;secret-thing&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3f6a6cd6f1c827f0daf3852d9aca1754&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3d2ab260-c719-4073-8598-f1c43571235f
X-Runtime: 0.045153
Content-Length: 1045</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 101,
  "username" : "foo",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:51:10.649Z",
  "updatedAt" : "2016-08-30T09:51:10.649Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 2,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : "de",
  "email" : "someone@timeslot.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "91ba5ff4-a939-42c1-abc3-d0c1855d3f5b",
  "friendsCalendarUuid" : "df469ae0-1e24-4bb4-92b5-385ebf2622bc",
  "allMySlotsUuid" : "ec28ee09-f658-439c-abcc-7cd3a77f343e",
  "myCreatedSlotsUuid" : "3c6f7fe8-670d-48b1-aa6a-fd6431054696",
  "myPrivateSlotsUuid" : "cafc2b10-c237-442e-aaa6-c463b1927e30",
  "myFriendSlotsUuid" : "3272bc58-a22b-40a1-88bb-57e1e1525db9",
  "myPublicSlotsUuid" : "a8e5a79f-a909-4e7a-9bf6-5ae57e3e5a9f",
  "friendships" : [],
  "memberships" : [
    {
      "groupId" : 21,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    },
    {
      "groupId" : 22,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself",
  "authToken" : "eI7MtpiAq4k1VoByyrQolMseeBw"
}
```
