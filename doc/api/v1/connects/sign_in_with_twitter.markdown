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
Vary: Accept-Encoding, Origin
ETag: W/&quot;5b131330aed7bb024359923daa05a1de&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a1b39882-ea55-402c-b890-d7042622a78c
X-Runtime: 0.032888
Content-Length: 896</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 6,
  "username" : "alexandrospar",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:42.072Z",
  "updatedAt" : "2016-08-30T09:50:42.072Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : null,
  "email" : null,
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "92a0390f-6fbf-4b89-ae61-9a68c0766f92",
  "friendsCalendarUuid" : "c237c962-7eaa-40f4-a28e-ec3be871b8c8",
  "allMySlotsUuid" : "b44170bc-6796-46d0-b3c7-a42c931c1fa1",
  "myCreatedSlotsUuid" : "a23a1335-1bfa-41f4-961f-24f6646d9957",
  "myPrivateSlotsUuid" : "5df477b3-a96f-49fb-a00d-0e2ec5375a70",
  "myFriendSlotsUuid" : "f0094ff2-8867-4bec-b7cc-7ab7c2c62533",
  "myPublicSlotsUuid" : "0b3f7a19-817a-4bf6-bb40-a5c12daef511",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "1SQiNe0UVuUUi7RFnNSKNy-0SzA"
}
```
