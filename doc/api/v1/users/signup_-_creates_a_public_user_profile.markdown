# Users API

## Signup - Creates a public user profile

### POST /v1/users/public

Either an email or phone number must be provided

returns 401 if user is not logged in

returns 403 if user account has no email

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : username
Description : Username of user (max. 50 characters)

Name : email
Description : Email of user (max. 254 characters)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : lang
Description : Language of user (2 characters, ISO 639-1)

Name : password
Description : Password for user (min. 5 &amp; max. 72 characters)

Name : role *- required -*
Description : Must be define the users role: &#39;public_user&#39;


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
Authorization: Token token=Imro7zwPt6WN6PrrGuf4uY5niMs
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/users/public</pre>

#### Body
```javascript
{
  "username" : "foo",
  "email" : "someone@timeslot.com",
  "lang" : "de",
  "password" : "secret-thing",
  "role" : "public_user"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/public&quot; -d &#39;{&quot;username&quot;:&quot;foo&quot;,&quot;email&quot;:&quot;someone@timeslot.com&quot;,&quot;lang&quot;:&quot;de&quot;,&quot;password&quot;:&quot;secret-thing&quot;,&quot;role&quot;:&quot;public_user&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Imro7zwPt6WN6PrrGuf4uY5niMs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;fca80b91b41465afcc4c7d54517b5e4d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a87ecda4-24fe-4079-be22-f5c45e99473f
X-Runtime: 0.043009
Content-Length: 1042</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 104,
  "username" : "foo",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:51:10.783Z",
  "updatedAt" : "2016-08-30T09:51:10.783Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 2,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : "de",
  "email" : "user150@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "2ee69a96-6a10-4000-80cb-99fa19573236",
  "friendsCalendarUuid" : "8c1282c2-4d4d-4c27-aeef-57b103c61bde",
  "allMySlotsUuid" : "548933dd-bb00-46b2-8c66-1bc015e3027d",
  "myCreatedSlotsUuid" : "94804977-f133-4d48-8441-77cf1e574236",
  "myPrivateSlotsUuid" : "a7b532ba-7d68-406d-abac-359edb286008",
  "myFriendSlotsUuid" : "e1d5478e-f0b2-458a-ba24-bb73fd9349bb",
  "myPublicSlotsUuid" : "2292be6c-989d-4ecb-b71f-d8f4cd894984",
  "friendships" : [],
  "memberships" : [
    {
      "groupId" : 25,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    },
    {
      "groupId" : 26,
      "state" : "active",
      "color" : "000000",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself",
  "authToken" : "yFTi7iGuZnwSeySXVY1337om9Po"
}
```
