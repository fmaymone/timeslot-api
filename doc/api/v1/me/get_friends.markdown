# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=_fnYLLyDQYDt3SV2GrNxdl0Yjbg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=_fnYLLyDQYDt3SV2GrNxdl0Yjbg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;98f46b23ef2d35b565ca5679a94a186f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 26d38cbf-c0e0-4139-889f-0852123f7f22
X-Runtime: 0.027129
Content-Length: 649</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 50,
    "username" : "User 591",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:54.049Z",
    "updatedAt" : "2016-08-30T09:50:54.049Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 52,
    "username" : "User 593",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:54.062Z",
    "updatedAt" : "2016-08-30T09:50:54.062Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 53,
    "username" : "User 594",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:54.069Z",
    "updatedAt" : "2016-08-30T09:50:54.069Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
