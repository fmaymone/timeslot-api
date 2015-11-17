# Connects API

## Sign up/in with facebook (matching email address)

### POST /v1/fb-connect

returns 200 and signs the user with the matching email address in if the email on timeslot is verified (we assume he is the legit owner of the existingtimeslot account)

returns 422 if the email is used by other timeslot user but is not verified (We don&#39;t have better idea or specification yet)

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

Name : authToken
Description : Auth Token

### Request

#### Headers

<pre>Content-Type: application/json
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

<pre class="request">curl &quot;http://localhost:5000/v1/fb-connect&quot; -d &#39;{&quot;socialId&quot;:10152854206708061,&quot;username&quot;:&quot;Silvi O Ivlis&quot;,&quot;email&quot;:&quot;alexpar@gmail.com&quot;,&quot;first_name&quot;:&quot;Silvi&quot;,&quot;middle_name&quot;:&quot;O&quot;,&quot;last_name&quot;:&quot;Ivlis&quot;,&quot;gender&quot;:&quot;male&quot;,&quot;link&quot;:&quot;https://www.facebook.com/app_scoped_user_id/10152854206708061/&quot;,&quot;locale&quot;:&quot;en_US&quot;,&quot;timezone&quot;:2,&quot;updated_time&quot;:&quot;2013-12-04T18:09:09+0000&quot;,&quot;verified&quot;:1,&quot;token&quot;:&quot;CAAFayXB6p6oBAChjrbg1RB6QoIdJyZC6k5xI8Srd214c13eMbtTasOTHwueRfw7jTqRiHSyOh4a9mOvN81obZCtQBBfrnVWjovjC8N00J0bfStxQLXVD3AfSgL8GSSXkkyO8mbTM85jidp4WZCZAAdCjQzNEmoelrnDow9tgILcF2fJrK3t1PZBcHh0II51ub9VvHaZC4ujQgsGPIZCmyuCDbZCUk7UMuul5o6telCWe0taZCRFsdwrHj&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;99a235572f929c873fd877d933af29ef&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 31c6daf9-5f50-450d-94ea-129175ddc68c
X-Runtime: 0.029418
Vary: Origin
Content-Length: 754</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 57,
  "username" : "User 52",
  "createdAt" : "2015-11-17T12:12:34.098Z",
  "updatedAt" : "2015-11-17T12:12:34.098Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : "alexpar@gmail.com",
  "emailVerified" : true,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
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
  "memberships" : [],
  "authToken" : "yYvLjeR6bYk-f49YE8LtiTEgN-o"
}
```
