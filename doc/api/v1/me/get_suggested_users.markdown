# Me API

## Get suggested Users

### GET /v1/me/suggested_users

Returns an array which includes Kaweh if User has no friends whatsoever. If User has one or more friends returns the friends-of-the-friends (&#39;foafs&#39; :).

### Response Fields

Name : array
Description : contains potentially interesting users

### Request

#### Headers

<pre>Authorization: Token token=5W_kLvdkJlIEeFWIrCenA8JSpoE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/suggested_users</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/suggested_users&quot; -X GET \
	-H &quot;Authorization: Token token=5W_kLvdkJlIEeFWIrCenA8JSpoE&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;bf53f3ecbb97210b364ed44d180ce2f2&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b8e2ec1c-2ab4-4114-92da-4ee7b59e7acf
X-Runtime: 0.015873
Content-Length: 655</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 42,
    "username" : "User 583",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:53.958Z",
    "updatedAt" : "2016-08-30T09:50:53.958Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 46,
    "username" : "User 587",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:54.001Z",
    "updatedAt" : "2016-08-30T09:50:54.001Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 48,
    "username" : "User 589",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:50:54.010Z",
    "updatedAt" : "2016-08-30T09:50:54.010Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
