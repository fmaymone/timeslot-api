# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=0XHm_V3MedOWTRFfECptIIxjyX4
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=0XHm_V3MedOWTRFfECptIIxjyX4&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;38dd04b7bd2dfbca9f0a917e0ac88c5c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3fb95850-c2b4-4d46-8eeb-528046dd2198
X-Runtime: 0.022320
Vary: Origin
Content-Length: 496</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 50,
    "username" : "User 212",
    "createdAt" : "2016-04-04T20:50:24.340Z",
    "updatedAt" : "2016-04-04T20:50:24.340Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 52,
    "username" : "User 214",
    "createdAt" : "2016-04-04T20:50:24.354Z",
    "updatedAt" : "2016-04-04T20:50:24.354Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 53,
    "username" : "User 215",
    "createdAt" : "2016-04-04T20:50:24.360Z",
    "updatedAt" : "2016-04-04T20:50:24.360Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
