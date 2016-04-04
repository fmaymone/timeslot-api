# Me API

## Get suggested Users

### GET /v1/me/suggested_users

Returns an array which includes Kaweh if User has no friends whatsoever. If User has one or more friends returns the friends-of-the-friends (&#39;foafs&#39; :).

### Response Fields

Name : array
Description : contains potentially interesting users

### Request

#### Headers

<pre>Authorization: Token token=e--cVsNkO6i2ml3S9o1k5J2cxoI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/suggested_users</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/suggested_users&quot; -X GET \
	-H &quot;Authorization: Token token=e--cVsNkO6i2ml3S9o1k5J2cxoI&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8838285aa3eb660f29f39cee214f41ce&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 6c299cc7-c5f3-4f27-b790-981ee6d3f5d1
X-Runtime: 0.015262
Vary: Origin
Content-Length: 502</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 42,
    "username" : "User 204",
    "createdAt" : "2016-04-04T20:50:24.237Z",
    "updatedAt" : "2016-04-04T20:50:24.237Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 46,
    "username" : "User 208",
    "createdAt" : "2016-04-04T20:50:24.290Z",
    "updatedAt" : "2016-04-04T20:50:24.290Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 48,
    "username" : "User 210",
    "createdAt" : "2016-04-04T20:50:24.302Z",
    "updatedAt" : "2016-04-04T20:50:24.302Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  }
]
```
