# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=QxUoluwzs6Gqly6FE-i2KgzznSY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=QxUoluwzs6Gqly6FE-i2KgzznSY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c8cf11d2becb37737a691d01f4736f0c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 470cba1e-908f-437e-b042-479cd1461321
X-Runtime: 0.019526
Vary: Origin
Content-Length: 499</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 124,
    "username" : "User 202",
    "createdAt" : "2016-01-21T23:11:38.203Z",
    "updatedAt" : "2016-01-21T23:11:38.203Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 126,
    "username" : "User 204",
    "createdAt" : "2016-01-21T23:11:38.216Z",
    "updatedAt" : "2016-01-21T23:11:38.216Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 127,
    "username" : "User 205",
    "createdAt" : "2016-01-21T23:11:38.222Z",
    "updatedAt" : "2016-01-21T23:11:38.222Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
