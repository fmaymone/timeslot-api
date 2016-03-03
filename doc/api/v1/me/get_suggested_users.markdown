# Me API

## Get suggested Users

### GET /v1/me/suggested_users

Returns an array which includes Kaweh if User has no friends whatsoever. If User has one or more friends returns the friends-of-the-friends (&#39;foafs&#39; :).

### Response Fields

Name : array
Description : contains potentially interesting users

### Request

#### Headers

<pre>Authorization: Token token=k_E8FB9cG2p4JUw2UOsUeCzIKYA
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/suggested_users</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/suggested_users&quot; -X GET \
	-H &quot;Authorization: Token token=k_E8FB9cG2p4JUw2UOsUeCzIKYA&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;cabab387201b2b049e079d1ce9fed64f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 173212a3-c442-47ad-80f2-0aabf160f51b
X-Runtime: 0.015693
Vary: Origin
Content-Length: 502</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 42,
    "username" : "User 186",
    "createdAt" : "2016-03-03T13:47:57.867Z",
    "updatedAt" : "2016-03-03T13:47:57.867Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 46,
    "username" : "User 190",
    "createdAt" : "2016-03-03T13:47:57.905Z",
    "updatedAt" : "2016-03-03T13:47:57.905Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 48,
    "username" : "User 192",
    "createdAt" : "2016-03-03T13:47:57.914Z",
    "updatedAt" : "2016-03-03T13:47:57.914Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
