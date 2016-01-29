# Users API

## Get list of friends of another user

### GET /v1/users/:id/friends

Other user must be friend with current user.

returns list of friends of other user

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the friends of.

### Request

#### Headers

<pre>Authorization: Token token=ghPqk_TK8YOBxW1ZdpCeTGfiJA0
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/211/friends</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/users/211/friends&quot; -X GET \
	-H &quot;Authorization: Token token=ghPqk_TK8YOBxW1ZdpCeTGfiJA0&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5bebe8061b96bcba80c660fdf0f7983c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 59f81281-f0c2-43c1-adfc-c2dba4615105
X-Runtime: 0.020268
Vary: Origin
Content-Length: 671</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 212,
    "username" : "User 542",
    "createdAt" : "2016-01-29T19:39:19.778Z",
    "updatedAt" : "2016-01-29T19:39:19.778Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 213,
    "username" : "User 543",
    "createdAt" : "2016-01-29T19:39:19.787Z",
    "updatedAt" : "2016-01-29T19:39:19.787Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 214,
    "username" : "User 544",
    "createdAt" : "2016-01-29T19:39:19.796Z",
    "updatedAt" : "2016-01-29T19:39:19.796Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 215,
    "username" : "User 545",
    "createdAt" : "2016-01-29T19:39:19.807Z",
    "updatedAt" : "2016-01-29T19:39:19.807Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "myself"
  }
]
```
