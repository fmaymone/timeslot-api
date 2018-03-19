# Groups API

## Add image to existing group

### PATCH /v1/groups/:group_uuid

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary the client updates the group with the image information.

returns 200 and the group data if the image was successfully added or updated

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to update

Name : image *- required -*
Description : Cloudinary ID / URL


### Response Fields

Name : id
Description : ID of the group

Name : name
Description : name of the group

Name : owner
Description : user info of group owner

Name : membersCanPost
Description : Can subscribers add slots?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : image
Description : URL of the group image

Name : description
Description : The description of the group

Name : defaultColor
Description : default color of the group, can be overwritten per member

Name : createdAt
Description : Creation of group

Name : updatedAt
Description : Latest update of group in db

Name : deletedAt
Description : Deletion of group

Name : membershipState
Description : Membership state for current user

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=1r9SL3UnT0EP0WPRoseCwQUtaLo
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/018144ed-8aa2-4645-b935-4645969a8fae</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/018144ed-8aa2-4645-b935-4645969a8fae&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=1r9SL3UnT0EP0WPRoseCwQUtaLo&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;94866a5a0bf6bb0196d0aa61835b8cb5&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 364fa67a-acf2-4a3d-8cce-40f3de9276b5
X-Runtime: 0.033960
Content-Length: 614</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript

```
