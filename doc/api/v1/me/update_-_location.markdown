# Me API

## Update - location

### PATCH /v1/me

### Parameters

Name : username
Description : Updated username of user (max. 50 characters)

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

Name : location
Description : ID of users home location

Name : name
Description : Name of the IOS location, e.g. Timeslot Inc. (255 chars)

Name : thoroughfare
Description : Street address, Dolziger Str. 9 (255 chars)

Name : subThoroughfare
Description : house number, e.g. 9 (255 chars)

Name : locality
Description : city, e.g. Berlin (255 chars)

Name : subLocality
Description : neighborhood, common name, e.g. Mitte (255 chars)

Name : postalCode
Description : zip code, e.g. 94114 (32 chars)

Name : country
Description : country, e.g. Germany (255 chars)

Name : isoCountryCode
Description : Country Code, e.g. US (8 chars)

Name : inLandWater
Description : e.g. Lake Tahoe

Name : ocean
Description : e.g. Pacific Ocean

Name : areasOfInterest
Description : e.g. Volkspark Friedrichshain

Name : latitude
Description : Latitude

Name : longitude
Description : Longitude

Name : private_location
Description : private location for this user (true/false) [not yet sure what it will mean technically] -&gt; default: false


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

<pre>Content-Type: application/json
Authorization: Token token=Q1Fv_V_FBZ6xzwvOPtSTw2xlVJs
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/me</pre>

#### Body
```javascript
{
  "location" : {
    "name" : "Acapulco"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me&quot; -d &#39;{&quot;location&quot;:{&quot;name&quot;:&quot;Acapulco&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Q1Fv_V_FBZ6xzwvOPtSTw2xlVJs&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f7bcda1d5b8f7acd4e9087948174fcba&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 620519b5-0bd6-412b-a74e-6fff26a75542
X-Runtime: 0.027758
Vary: Origin
Content-Length: 1074</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 77,
  "username" : "User 239",
  "createdAt" : "2016-04-04T20:50:24.853Z",
  "updatedAt" : "2016-04-04T20:50:24.874Z",
  "deletedAt" : null,
  "image" : "",
  "location" : {
    "id" : "c89f5ee2-3324-439a-a146-04a9ad3c26cd",
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
    "latitude" : null,
    "longitude" : null
  },
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user48@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "267ab35d-95ed-4211-b3cf-af17691d849d",
  "friendsCalendarUuid" : "64defdbc-677a-486e-a55a-42a819a50c54",
  "allMySlotsUuid" : "e65cdbe4-9bff-4769-9c4e-0cbb23a9dd58",
  "myCreatedSlotsUuid" : "d8132c44-ea74-45e3-a9a0-44a6fd08341d",
  "myFriendSlotsUuid" : "07818261-4ae9-451f-a0d8-e62fd4f4dccc",
  "myPublicSlotsUuid" : "c3c65504-d20d-4470-abc6-d43ae5207734",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
