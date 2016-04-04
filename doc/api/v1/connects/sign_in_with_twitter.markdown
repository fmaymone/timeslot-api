# Connects API

## Sign in with twitter

### POST /v1/tw-connect

Existing connection to the submitted twitter account

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
ETag: W/&quot;685792419d76b1e419ec5a0a5a76dae8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 8deafb1f-4635-43ce-9520-8ade3d4c23f1
X-Runtime: 0.023694
Vary: Origin
Content-Length: 771</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 9,
  "username" : "alexandrospar",
  "createdAt" : "2016-04-04T20:50:20.808Z",
  "updatedAt" : "2016-04-04T20:50:20.808Z",
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
  "myCalendarUuid" : "c4cd0d34-03e9-4d76-9f04-6840db914924",
  "friendsCalendarUuid" : "eea9bdb9-9868-47eb-8984-1416a5d07901",
  "allMySlotsUuid" : "cc42fd7f-9ac9-4ce4-8b76-93e8766c4992",
  "myCreatedSlotsUuid" : "76f85c5e-43af-49b2-8281-a6dd8438d5ad",
  "myFriendSlotsUuid" : "dafbf964-5a48-4d12-a0d2-bccda31ea086",
  "myPublicSlotsUuid" : "9308c7ef-43bd-4f1a-92a7-65e58be1f374",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "ydJLhBAZr9d1035O-n_CSXhzUY4"
}
```
