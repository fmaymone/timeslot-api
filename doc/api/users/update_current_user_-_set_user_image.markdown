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
Authorization: Token token=8C9Qh1vU5Hqg8K-BZubIkX6jngY
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body

<pre>{"image":{"publicId":"v1234567/xcvjghjkdisudgfds7iyf.jpg"}}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/xcvjghjkdisudgfds7iyf.jpg&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=8C9Qh1vU5Hqg8K-BZubIkX6jngY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;35a9c9eb1fb4c044ba84eb729f8cf54c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 10e80e3a-787d-4ab2-ba70-ccfb5b2cb24b
X-Runtime: 0.018741
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
  "createdAt" : "2015-05-06T11:28:52.039Z",
  "updatedAt" : "2015-05-06T11:28:52.039Z",
  "deletedAt" : null,
  "image" : "v1234567/xcvjghjkdisudgfds7iyf.jpg",
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendships" : [],
  "groups" : []
}</pre>
