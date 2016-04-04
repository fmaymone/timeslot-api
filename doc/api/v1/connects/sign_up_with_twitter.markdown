# Connects API

## Sign up with twitter

### POST /v1/tw-connect

returns 200 and an authToken

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

Name : authToken
Description : Auth Token

### Request

#### Headers

<pre>Content-Type: application/json
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

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/tw-connect&quot; -d &#39;{&quot;username&quot;:&quot;alexandrospar&quot;,&quot;socialId&quot;:3186786310,&quot;auth_token&quot;:&quot;3186786310-OCKGioG9L94PwGc3Qjm4jIU6xIm1Bi5sWrl37xV&quot;,&quot;auth_secret&quot;:&quot;CAAFayXB6p6oBAChjrbg1RB6QoIdJyZasdfljk214C6k5x&quot;}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;67c2f8115b7ecb3614fe07c5357ca116&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6e486fb7-4798-4b0d-8252-cf712c4a769e
X-Runtime: 0.025390
Vary: Origin
Content-Length: 771</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 7,
  "username" : "alexandrospar",
  "createdAt" : "2016-04-04T20:50:20.756Z",
  "updatedAt" : "2016-04-04T20:50:20.756Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "lang" : null,
  "email" : null,
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "f13e2887-506a-4d2f-a507-fa9c93deaf24",
  "friendsCalendarUuid" : "fa495077-1f5a-4d24-afde-99864ff1db00",
  "allMySlotsUuid" : "1830d64c-f699-4d0c-bfb9-5cda3628d350",
  "myCreatedSlotsUuid" : "5808aaa7-9901-400d-a7b0-c402c5e47cfa",
  "myFriendSlotsUuid" : "c81c265f-aa41-40b7-89c4-48d9d0afe8be",
  "myPublicSlotsUuid" : "f4b5477e-e04a-4540-b544-1805c2943038",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "t18t_79m_BhyqC0qtce_iuCI8lM"
}
```
