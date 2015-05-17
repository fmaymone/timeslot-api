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
Authorization: Token token=9D6fucJrGle3yY2WSfeNCE9xD8k
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/users</pre>

#### Body
```javascript
{
  "image" : {
    "publicId" : "v1234567/xcvjghjkdisudgfds7iyf.jpg"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/users&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/xcvjghjkdisudgfds7iyf.jpg&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=9D6fucJrGle3yY2WSfeNCE9xD8k&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;be5d3fa83dacf51ae705d2e69e90edbd&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b539e8a5-de3d-4b00-9116-7a46b622dc30
X-Runtime: 0.024694
Content-Length: 733</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
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
  "createdAt" : "2015-05-06T21:29:39.664Z",
  "updatedAt" : "2015-05-06T21:29:39.664Z",
  "deletedAt" : null,
  "image" : "v1234567/xcvjghjkdisudgfds7iyf.jpg",
  "slotCount" : 0,
  "reslotCount" : 0,
  "friendsCount" : 0,
  "friendships" : [],
  "groups" : []
}
```
