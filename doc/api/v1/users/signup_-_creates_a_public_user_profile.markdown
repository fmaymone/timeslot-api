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

Name : authToken
Description : Authentication Token for the user to be set as a HTTP header in subsequent requests

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=9TaZ8Fc_Vh-kZcS7tcoORtXf7ic
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
	-H &quot;Authorization: Token token=9TaZ8Fc_Vh-kZcS7tcoORtXf7ic&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;7adc65f565298c43c022193698e9fb66&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 895a1ed6-e1de-4122-ad81-7cace964e71b
X-Runtime: 0.023669
Content-Length: 943</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 124,
  "username" : "foo",
  "createdAt" : "2016-05-25T10:18:06.415Z",
  "updatedAt" : "2016-05-25T10:18:06.415Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 2,
  "friendsCount" : 0,
  "lang" : "de",
  "email" : "user145@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "8f8bf696-32e1-459c-a230-25df494a4376",
  "friendsCalendarUuid" : "cf87b4cb-7fb0-479a-afda-85109e484dde",
  "allMySlotsUuid" : "e6a04dc2-d354-46be-9363-50df06e5c91e",
  "myCreatedSlotsUuid" : "4cc33ca6-d260-4d45-8b63-ad28a2e0784d",
  "myPrivateSlotsUuid" : "1a938920-e16b-4ceb-b460-8de142051112",
  "myFriendSlotsUuid" : "58393843-3754-48a6-bdf3-99a4e76ccfae",
  "myPublicSlotsUuid" : "deb73a7c-64f7-4940-972b-c87e708568d7",
  "friendships" : [],
  "memberships" : [
    {
      "groupId" : 25,
      "state" : "active",
      "notifications" : true
    },
    {
      "groupId" : 26,
      "state" : "active",
      "notifications" : true
    }
  ],
  "friendshipState" : "myself",
  "authToken" : "FNzoOFCT1h9wmhsZ5pAN4xVM9zs"
}
```
