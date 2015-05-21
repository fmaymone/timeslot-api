# Connects API

## Sign in with facebook

### POST /v1/fb-connect

Existing connection to the submitted facebook account

returns 200 and an authToken

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

<pre class="request">curl &quot;http://localhost:3000/v1/fb-connect&quot; -d &#39;{&quot;socialId&quot;:10152854206708061,&quot;username&quot;:&quot;Silvi O Ivlis&quot;,&quot;email&quot;:&quot;alexpar@gmail.com&quot;,&quot;first_name&quot;:&quot;Silvi&quot;,&quot;middle_name&quot;:&quot;O&quot;,&quot;last_name&quot;:&quot;Ivlis&quot;,&quot;gender&quot;:&quot;male&quot;,&quot;link&quot;:&quot;https://www.facebook.com/app_scoped_user_id/10152854206708061/&quot;,&quot;locale&quot;:&quot;en_US&quot;,&quot;timezone&quot;:2,&quot;updated_time&quot;:&quot;2013-12-04T18:09:09+0000&quot;,&quot;verified&quot;:1,&quot;token&quot;:&quot;CAAFayXB6p6oBAChjrbg1RB6QoIdJyZC6k5xI8Srd214c13eMbtTasOTHwueRfw7jTqRiHSyOh4a9mOvN81obZCtQBBfrnVWjovjC8N00J0bfStxQLXVD3AfSgL8GSSXkkyO8mbTM85jidp4WZCZAAdCjQzNEmoelrnDow9tgILcF2fJrK3t1PZBcHh0II51ub9VvHaZC4ujQgsGPIZCmyuCDbZCUk7UMuul5o6telCWe0taZCRFsdwrHj&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1bbc8e0f8d6e32ae9c59ef4978885dc3&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e0a6db4a-9f07-426d-b606-f461b8576eea
X-Runtime: 0.009150
Content-Length: 680</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 45,
  "username" : "User 44",
  "email" : null,
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "locationId" : null,
  "locationName" : null,
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
  "createdAt" : "2015-05-19T10:51:48.799Z",
  "updatedAt" : "2015-05-19T10:51:48.799Z",
  "deletedAt" : null,
  "friendships" : [],
  "memberships" : [],
  "authToken" : "Dl9XHS1-fluZAowZmQaPUqKEIEg"
}
```
