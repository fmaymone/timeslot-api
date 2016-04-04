# Connects API

## Connect facebook account

### POST /v1/fb-connect

User must be signed in, no existing connection to the submitted facebook account

If Facebook provides an email and the user has no timeslot email set, the fb email will be used.

returns 200 and the user data

returns 422 if email already used by other user

### Parameters

Name : socialId *- required -*
Description : Facebook App specific ID of the user

Name : username *- required -*
Description : Username of user (max. 50 characters)

Name : email
Description : Email of the user on facebook

Name : first_name
Description : First name of the user on facebook

Name : middle_name
Description : Middle name of the user on facebook

Name : last_name
Description : Last name of the user on facebook

Name : gender
Description : Gender of the user on facebook

Name : link
Description : URL of the users public profile on facebook

Name : locale
Description : Locale of the user on facebook

Name : timezone
Description : Timezone of the user on facebook

Name : updated_time
Description : Last updated time of the user on facebook

Name : verified
Description : Verification state of the user on facebook

Name : token
Description : Facebook secret token for the user


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : email
Description : Email of the user

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=SGY7W33FQaIiXa7q1NUEco3avf0
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/fb-connect</pre>

#### Body
```javascript
{
  "socialId" : 10152854206708061,
  "username" : "Silvi O Ivlis",
  "email" : "alexpar@gmail.com",
  "first_name" : "Silvi",
  "middle_name" : "O",
  "last_name" : "Ivlis",
  "gender" : "male",
  "link" : "https://www.facebook.com/app_scoped_user_id/10152854206708061/",
  "locale" : "en_US",
  "timezone" : 2,
  "updated_time" : "2013-12-04T18:09:09+0000",
  "verified" : 1,
  "token" : "CAAFayXB6p6oBAChjrbg1RB6QoIdJyZC6k5xI8Srd214c13eMbtTasOTHwueRfw7jTqRiHSyOh4a9mOvN81obZCtQBBfrnVWjovjC8N00J0bfStxQLXVD3AfSgL8GSSXkkyO8mbTM85jidp4WZCZAAdCjQzNEmoelrnDow9tgILcF2fJrK3t1PZBcHh0II51ub9VvHaZC4ujQgsGPIZCmyuCDbZCUk7UMuul5o6telCWe0taZCRFsdwrHj"
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/fb-connect&quot; -d &#39;{&quot;socialId&quot;:10152854206708061,&quot;username&quot;:&quot;Silvi O Ivlis&quot;,&quot;email&quot;:&quot;alexpar@gmail.com&quot;,&quot;first_name&quot;:&quot;Silvi&quot;,&quot;middle_name&quot;:&quot;O&quot;,&quot;last_name&quot;:&quot;Ivlis&quot;,&quot;gender&quot;:&quot;male&quot;,&quot;link&quot;:&quot;https://www.facebook.com/app_scoped_user_id/10152854206708061/&quot;,&quot;locale&quot;:&quot;en_US&quot;,&quot;timezone&quot;:2,&quot;updated_time&quot;:&quot;2013-12-04T18:09:09+0000&quot;,&quot;verified&quot;:1,&quot;token&quot;:&quot;CAAFayXB6p6oBAChjrbg1RB6QoIdJyZC6k5xI8Srd214c13eMbtTasOTHwueRfw7jTqRiHSyOh4a9mOvN81obZCtQBBfrnVWjovjC8N00J0bfStxQLXVD3AfSgL8GSSXkkyO8mbTM85jidp4WZCZAAdCjQzNEmoelrnDow9tgILcF2fJrK3t1PZBcHh0II51ub9VvHaZC4ujQgsGPIZCmyuCDbZCUk7UMuul5o6telCWe0taZCRFsdwrHj&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=SGY7W33FQaIiXa7q1NUEco3avf0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c7dc7ef1a0d1ff08a233367623331acc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d1bb86b5-d7a1-48ec-8cb8-6bcaaf7fd66c
X-Runtime: 0.020385
Vary: Origin
Content-Length: 737</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 59,
  "username" : "User 46",
  "createdAt" : "2016-04-04T20:50:20.574Z",
  "updatedAt" : "2016-04-04T20:50:20.574Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "user1@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "8454bf28-fe8e-4584-8c4e-d41e75bc276d",
  "friendsCalendarUuid" : "6e89d883-2e64-4b44-af1d-5d66a47e12c8",
  "allMySlotsUuid" : "44ffccec-3bcf-40c6-919f-4f182d25c5e9",
  "myCreatedSlotsUuid" : "be8c51bf-e096-4e81-9ffc-1102381286bf",
  "myFriendSlotsUuid" : "e316d137-c458-4a7a-91d5-b6e37bd196f4",
  "myPublicSlotsUuid" : "eff8f01b-4f12-4ddd-a2d3-5fa670bdf43d",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
