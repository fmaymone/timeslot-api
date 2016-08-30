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
Authorization: Token token=a0JyRGhb4D-XMSagySihucI_WS8
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
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=a0JyRGhb4D-XMSagySihucI_WS8&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;724ad4bdb520c471075e03ca9c241925&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 41ca74df-b102-49fc-a426-25040eaac66a
X-Runtime: 0.021193
Content-Length: 861</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 7,
  "username" : "User 48",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:42.109Z",
  "updatedAt" : "2016-08-30T09:50:42.109Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "calendarCount" : 0,
  "friendsCount" : 0,
  "gender" : null,
  "lang" : null,
  "email" : "user3@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "push" : true,
  "myCalendarUuid" : "0bccd7a8-ab5b-4975-a670-28ce5fce86e0",
  "friendsCalendarUuid" : "ab39399d-d5e3-40e3-9115-063f7600e3cc",
  "allMySlotsUuid" : "e0eeca79-dae9-48a7-b440-fdf0b666e9e5",
  "myCreatedSlotsUuid" : "c41418b2-fa18-4410-ba5a-39a29cda1158",
  "myPrivateSlotsUuid" : "cfe06998-f7b9-4c54-a00c-5e5d19c671ba",
  "myFriendSlotsUuid" : "9a0e4992-3224-4eaf-8467-5c38fa61dd5b",
  "myPublicSlotsUuid" : "f34c848a-c107-4591-9760-735ae0ba6e90",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself"
}
```
