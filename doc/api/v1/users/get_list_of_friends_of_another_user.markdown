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

<pre>Authorization: Token token=PxZObjksIXG7i7ZPwKCxZQlvmEk
Accept: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/users/182/friends</pre>

#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/users/182/friends&quot; -X GET \
	-H &quot;Authorization: Token token=PxZObjksIXG7i7ZPwKCxZQlvmEk&quot; \
	-H &quot;Accept: application/json&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;5d68cad1466c1d3ae8b108aee5e44ac9&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 92895f2b-3b3c-480b-9799-ce4c7d015268
X-Runtime: 0.022039
Content-Length: 875</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
[
  {
    "id" : 183,
    "username" : "User 914",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:12.620Z",
    "updatedAt" : "2016-08-30T09:51:12.620Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 184,
    "username" : "User 915",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:12.627Z",
    "updatedAt" : "2016-08-30T09:51:12.627Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 185,
    "username" : "User 916",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:12.635Z",
    "updatedAt" : "2016-08-30T09:51:12.635Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "stranger"
  },
  {
    "id" : 186,
    "username" : "User 917",
    "firstName" : null,
    "middleName" : null,
    "lastName" : null,
    "createdAt" : "2016-08-30T09:51:12.649Z",
    "updatedAt" : "2016-08-30T09:51:12.649Z",
    "deletedAt" : null,
    "image" : "",
    "friendshipState" : "myself"
  }
]
```
