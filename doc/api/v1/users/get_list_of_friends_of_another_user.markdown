# Users API

## Get list of friends of another user

### GET /v1/users/:id/friends

Other user must be friend with current user.

returns list of friends of other user

returns 404 if current user not friend with other user

### Parameters

Name : id
Description : ID of the user to get the friends for.

### Request

#### Headers

<pre>Authorization: Token token=gu6SHAkZ330mBMbckbPry0IGguA
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/181/friends</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/181/friends&quot; -X GET \
	-H &quot;Authorization: Token token=gu6SHAkZ330mBMbckbPry0IGguA&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8c84e10ebc10febb45bab05188195582&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b3f7bad3-d93a-4bb3-8e03-31d18ccdf312
X-Runtime: 0.017760
Vary: Origin
Content-Length: 671</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 182,
    "username" : "User 478",
    "createdAt" : "2016-04-04T20:50:34.572Z",
    "updatedAt" : "2016-04-04T20:50:34.572Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 183,
    "username" : "User 479",
    "createdAt" : "2016-04-04T20:50:34.577Z",
    "updatedAt" : "2016-04-04T20:50:34.577Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 184,
    "username" : "User 480",
    "createdAt" : "2016-04-04T20:50:34.583Z",
    "updatedAt" : "2016-04-04T20:50:34.583Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 185,
    "username" : "User 481",
    "createdAt" : "2016-04-04T20:50:34.591Z",
    "updatedAt" : "2016-04-04T20:50:34.591Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "myself"
  }
]
```
