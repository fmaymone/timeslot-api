# Me API

## Unfriending / Cancel or Refuse Friend Requests

### DELETE /v1/me/friendship/:user_id

Deletes the friendship if both Users are friends.

Refuses an open friend request from other User to current user.

Cancels an open friend request from current user to other User.

Returns OK and the data of the given User.Returns 404 if the given User ID does not exist or the User has his account deactivated.

### Parameters

Name : user_id *- required -*
Description : ID of the User for whom the friendship/requestshould be invalidated.

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=GNgisacbRpJ9U6FJeefJYb8eBrk
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>DELETE /v1/me/friendship/161</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendship/161&quot; -d &#39;&#39; -X DELETE \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=GNgisacbRpJ9U6FJeefJYb8eBrk&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1381580e0456d3a237cf111a1e0a9c7a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 184147c7-312b-43d0-8896-a121be364a1c
X-Runtime: 0.015200
Vary: Origin
Content-Length: 220</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 161,
  "username" : "John",
  "createdAt" : "2015-12-02T02:27:13.872Z",
  "updatedAt" : "2015-12-02T02:27:13.872Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendshipState" : null
}
```
