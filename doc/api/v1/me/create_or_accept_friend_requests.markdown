# Me API

## Create or Accept Friend Requests

### POST /v1/me/friendship/:user_id

Accepts an open friend request from other User to current user if one exists.

Creates an open friend request from current user to other User if none exists yet.

Returns OK and the data of the given User.Returns 404 if the given User ID does not exist or the User has his account deactivated.

### Parameters

Name : user_id *- required -*
Description : ID of the User for whom the friendship/requestshould be invalidated.

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=pnV3-npsO6G0_2099kgvFzp74ns
Host: example.org
Content-Type: application/x-www-form-urlencoded
Cookie: </pre>

#### Route

<pre>POST /v1/me/friendship/159</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/me/friendship/159&quot; -d &#39;&#39; -X POST \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=pnV3-npsO6G0_2099kgvFzp74ns&quot; \
	-H &quot;Host: example.org&quot; \
	-H &quot;Content-Type: application/x-www-form-urlencoded&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5256756e11b539926a164ee8499cbfff&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 149b67a4-084f-41dc-83fe-3f7fedf14edf
X-Runtime: 0.020257
Vary: Origin
Content-Length: 225</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 159,
  "username" : "John",
  "createdAt" : "2015-12-02T02:27:13.829Z",
  "updatedAt" : "2015-12-02T02:27:13.829Z",
  "deletedAt" : null,
  "image" : "",
  "location" : null,
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendshipState" : "pending"
}
```
