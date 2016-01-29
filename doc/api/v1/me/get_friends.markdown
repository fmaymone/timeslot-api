# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=5dlQtjCfGd6XLEKhfp0UI378oVQ
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=5dlQtjCfGd6XLEKhfp0UI378oVQ&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;aeb78ce9341e79ffede127df9ea2f2d9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 3a512135-a492-4f65-8291-e8e9712190e0
X-Runtime: 0.019711
Vary: Origin
Content-Length: 499</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 127,
    "username" : "User 205",
    "createdAt" : "2016-01-29T19:39:01.333Z",
    "updatedAt" : "2016-01-29T19:39:01.333Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 129,
    "username" : "User 207",
    "createdAt" : "2016-01-29T19:39:01.352Z",
    "updatedAt" : "2016-01-29T19:39:01.352Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 130,
    "username" : "User 208",
    "createdAt" : "2016-01-29T19:39:01.359Z",
    "updatedAt" : "2016-01-29T19:39:01.359Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
