# Users API

## Signup - Create user with a specific device

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

Name : device *- required -*
Description : A key-value-paired array which describes the device, e.g. device = { system: &#39;ios&#39;, version: &#39;6.0b&#39;, deviceId: &#39;xxx-xxxx-xxx&#39; }

Name : system *- required -*
Description : A string shorthand of the current device operating system (max. 10 chars), e.g.: &#39;ios&#39;, &#39;android&#39; 

Name : version *- required -*
Description : A string for the version of the current device operating system (max. 10 chars), e.g.: &#39;6.0b&#39; 

Name : deviceId *- required -*
Description : A unique hardware ID from the current device (max. 128 chars)


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
  "password" : "secret-thing",
  "device" : {
    "device" : {
      "device_id" : "sn-333462873410834786765439533",
      "system" : "ios",
      "version" : "6.0"
    }
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users&quot; -d &#39;{&quot;username&quot;:&quot;foo&quot;,&quot;email&quot;:&quot;someone@timeslot.com&quot;,&quot;lang&quot;:&quot;de&quot;,&quot;password&quot;:&quot;secret-thing&quot;,&quot;device&quot;:{&quot;device&quot;:{&quot;device_id&quot;:&quot;sn-333462873410834786765439533&quot;,&quot;system&quot;:&quot;ios&quot;,&quot;version&quot;:&quot;6.0&quot;}}}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;498b784df1868ea968681aa9467e35d1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 50fa442c-bed8-447f-abb7-0f5bd0997141
X-Runtime: 0.018487
Vary: Origin
Content-Length: 781</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 119,
  "username" : "foo",
  "createdAt" : "2016-04-04T20:50:33.388Z",
  "updatedAt" : "2016-04-04T20:50:33.388Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "lang" : "de",
  "email" : "someone@timeslot.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "6c3e19a9-c6b6-4b4f-a35d-355c99863a6d",
  "friendsCalendarUuid" : "9df07b21-dc4f-4878-a4d5-0795503e3826",
  "allMySlotsUuid" : "a6817efb-de50-46c9-9fe6-6f7dff602e0a",
  "myCreatedSlotsUuid" : "cf819e60-e746-4cd7-ad83-49637319e68c",
  "myFriendSlotsUuid" : "08fe9899-cab3-4eea-a368-f343c1ba6eb7",
  "myPublicSlotsUuid" : "b380d2c6-ce11-44b5-8a45-a71ac9b578bc",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "rvebJK2XPtct6cxUt5J5lw66ngM"
}
```
