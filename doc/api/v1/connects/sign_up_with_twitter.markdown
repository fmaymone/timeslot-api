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
Vary: Accept-Encoding, Origin
ETag: W/&quot;b2d9239cb6083d1d2e6a82e1ce572db5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c7f378f3-df4c-43c8-9b66-257084c3a3c3
X-Runtime: 0.034348
Content-Length: 896</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 3,
  "username" : "alexandrospar",
  "firstName" : null,
  "middleName" : null,
  "lastName" : null,
  "createdAt" : "2016-08-30T09:50:42.025Z",
  "updatedAt" : "2016-08-30T09:50:42.025Z",
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
  "myCalendarUuid" : "fe35e1c0-33d8-4c8c-9afd-c4133febf44b",
  "friendsCalendarUuid" : "7e2ca5d3-4d56-49b3-8b8e-374621a6c4db",
  "allMySlotsUuid" : "b9b3f308-32b6-4b64-80d6-4ba693ebfc49",
  "myCreatedSlotsUuid" : "498a2ab9-0a7a-4494-babc-7d7ee678f1ec",
  "myPrivateSlotsUuid" : "cc5ff373-f163-419a-825f-610af1e0c8d2",
  "myFriendSlotsUuid" : "555e37e6-827d-4a47-95fb-4bef4f3ea7bd",
  "myPublicSlotsUuid" : "58bae463-d6fc-4a50-96ee-f885cdd851e0",
  "friendships" : [],
  "memberships" : [],
  "friendshipState" : "myself",
  "authToken" : "WYCdBiRWmLZN7PcHuPjt437uXFU"
}
```
