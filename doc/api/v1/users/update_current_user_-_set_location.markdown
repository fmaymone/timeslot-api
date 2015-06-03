# Users API

## Update current user - set location

### PATCH /v1/users

### Parameters

Name : username
Description : Updated username of user (max. 50 characters)

Name : email
Description : Email of user (max. 255 characters)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : image
Description : URL of the user image

Name : publicUrl
Description : Public URL for user on Timeslot (max. 255 chars)

Name : deviceToken
Description : IOS Device Token for Push Notifications (max. 128 chars)

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
Description : Name of the IOS location (128 chars)

Name : street
Description : Street of IOS location (128 chars)

Name : city
Description : City of IOS location (128 chars)

Name : postcode
Description : Postcode of IOS location (32 chars)

Name : country
Description : Country of IOS location (64 chars)

Name : latitude
Description : Latitude of IOS location

Name : longitude
Description : Longitude of IOS location

Name : auid
Description : Apple UID of the location

Name : private_location
Description : private location for this user (true/false) [not yet sure what it will mean technically] -&gt; default: false


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

Name : location
Description : Home location of user

Name : createdAt
Description : Creation of user

Name : updatedAt
Description : Latest update of user in db

Name : deletedAt
Description : Deletion of user

Name : slotCount
Description : Number of slots for this user

Name : reslotCount
Description : Number of reslots for this user

Name : friendsCount
Description : Number of friends for this user

Name : email
Description : Email of user (max. 255 characters)

Name : phone
Description : Phone number of user (max. 35 characters)

Name : publicUrl
Description : Public URL for user on Timeslot (max. 255 chars)

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

Name : friendships
Description : all connections to other users

Name : memberships
Description : all connections to groups

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=iWgGH30oi1HCaFJd1TsuzdlWmas
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body
```javascript
{
  "location" : {
    "name" : "Acapulco"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users&quot; -d &#39;{&quot;location&quot;:{&quot;name&quot;:&quot;Acapulco&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=iWgGH30oi1HCaFJd1TsuzdlWmas&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;738c2f9fdc93d3ee9af4a5ed2e643af6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fb805707-9225-4179-811a-ee45b64867d7
X-Runtime: 0.024444
Content-Length: 797</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 285,
  "username" : "User 281",
  "createdAt" : "2015-06-03T10:39:40.472Z",
  "updatedAt" : "2015-06-03T10:39:40.482Z",
  "deletedAt" : null,
  "location" : {
    "id" : 53,
    "name" : "Acapulco",
    "street" : "",
    "city" : "",
    "postcode" : "",
    "country" : "",
    "latitude" : null,
    "longitude" : null
  },
  "image" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "email" : "user68@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "slotDefaultDuration" : null,
  "slotDefaultLocationId" : null,
  "slotDefaultTypeId" : null,
  "defaultPrivateAlerts" : "0000000000",
  "defaultOwnFriendslotAlerts" : "0000000000",
  "defaultOwnPublicAlerts" : "0000000000",
  "defaultFriendsFriendslotAlerts" : "0000000000",
  "defaultFriendsPublicAlerts" : "0000000000",
  "defaultReslotAlerts" : "0000000000",
  "defaultGroupAlerts" : "0000000000",
  "friendships" : [],
  "memberships" : []
}
```
