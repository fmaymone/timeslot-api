# Connects API

## Connect twitter account

### POST /v1/tw-connect

User must be signed in, no existing connection to the submitted twitter account

returns 200 and the user data

### Parameters

Name : username *- required -*
Description : Username of user (max. 50 characters)

Name : socialId *- required -*
Description : Twitter ID of the user

Name : auth_token
Description : Twitter Auth Token

Name : auth_secret
Description : Twitter Auth Secret


### Response Fields

Name : id
Description : ID of the user

Name : username
Description : Username of the user

Name : image
Description : URL of the user image

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=WKQaJrWGwBnJtnEYfJBsmtrflR4
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/tw-connect</pre>

#### Body
```javascript
{
  "username" : "alexandrospar",
  "socialId" : 3186786310,
  "auth_token" : "3186786310-OCKGioG9L94PwGc3Qjm4jIU6xIm1Bi5sWrl37xV",
  "auth_secret" : "CAAFayXB6p6oBAChjrbg1RB6QoIdJyZasdfljk214C6k5x"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/tw-connect&quot; -d &#39;{&quot;username&quot;:&quot;alexandrospar&quot;,&quot;socialId&quot;:3186786310,&quot;auth_token&quot;:&quot;3186786310-OCKGioG9L94PwGc3Qjm4jIU6xIm1Bi5sWrl37xV&quot;,&quot;auth_secret&quot;:&quot;CAAFayXB6p6oBAChjrbg1RB6QoIdJyZasdfljk214C6k5x&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=WKQaJrWGwBnJtnEYfJBsmtrflR4&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7bb82d8e0f69efef6dc60b4438c251bc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5ce8d445-aeeb-42de-8057-85240d156556
X-Runtime: 0.021520
Content-Length: 717</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 53,
  "username" : "User 50",
  "createdAt" : "2015-06-22T08:44:14.766Z",
  "updatedAt" : "2015-06-22T08:44:14.766Z",
  "deletedAt" : null,
  "location" : null,
  "image" : {
    "publicId" : null,
    "localId" : null
  },
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "email" : "user3@email.com",
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
