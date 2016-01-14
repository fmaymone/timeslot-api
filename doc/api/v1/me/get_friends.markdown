# Me API

## Get friends

### GET /v1/me/friends

Returns an array which includes all friends of the current user.

### Response Fields

Name : array
Description : containing friends as a list of Users

### Request

#### Headers

<pre>Authorization: Token token=tuiUyubybn3hwt41f6uPVj6Rw7c
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/me/friends</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friends&quot; -X GET \
	-H &quot;Authorization: Token token=tuiUyubybn3hwt41f6uPVj6Rw7c&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;b141fd3a462cbf4912123e03c45f3803&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 50d409de-350d-4daa-9bc4-c6c68b5b57ab
X-Runtime: 0.015337
Vary: Origin
Content-Length: 499</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 133,
    "username" : "User 215",
    "createdAt" : "2016-01-14T16:03:37.848Z",
    "updatedAt" : "2016-01-14T16:03:37.848Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 135,
    "username" : "User 217",
    "createdAt" : "2016-01-14T16:03:37.867Z",
    "updatedAt" : "2016-01-14T16:03:37.867Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  },
  {
    "id" : 136,
    "username" : "User 218",
    "createdAt" : "2016-01-14T16:03:37.875Z",
    "updatedAt" : "2016-01-14T16:03:37.875Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "friend"
  }
]
```
