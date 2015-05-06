# Users API

## Update current user - set user image

### PATCH /v1/users

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary the client updates the group with the image information.

returns 200 and the users data if the image was successfully added or updated

### Parameters

Name : image *- required -*
Description : Scope for attributes of new image

Name : publicId *- required -*
Description : Cloudinary ID / URL


### Response Fields

Name : image
Description : URL for this media item

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=rHr0EusX9RzkOPCDu7uNkuowKzw
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body

<pre>{
  "image" : {
    "publicId" : "v1234567/xcvjghjkdisudgfds7iyf.jpg"
  }
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/xcvjghjkdisudgfds7iyf.jpg&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=rHr0EusX9RzkOPCDu7uNkuowKzw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;7a8ce68905dbb2f44cef9a10fb69547b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 717080df-6bb3-431e-9127-9ff10381d5e0
X-Runtime: 0.018903
Content-Length: 733</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 217,
  "username" : "User 216",
  "email" : "user60@email.com",
  "emailVerified" : false,
  "phone" : null,
  "phoneVerified" : false,
  "publicUrl" : null,
  "locationId" : null,
  "slotDefaultDuration" : null,
  "slotDefaultLocationId" : null,
  "slotDefaultTypeId" : null,
  "defaultPrivateAlerts" : "0000000000",
  "defaultOwnFriendslotAlerts" : "0000000000",
  "defaultOwnPublicAlerts" : "0000000000",
  "defaultFriendsFriendslotAlerts" : "0000000000",
  "defaultFriendsPublicAlerts" : "0000000000",
  "defaultReslotAlerts" : "0000000000",
  "defaultGroupAlerts" : "0000000000",
  "push" : true,
  "createdAt" : "2015-05-06T14:45:17.416Z",
  "updatedAt" : "2015-05-06T14:45:17.416Z",
  "deletedAt" : null,
  "image" : "v1234567/xcvjghjkdisudgfds7iyf.jpg",
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendships" : [],
  "groups" : []
}</pre>
