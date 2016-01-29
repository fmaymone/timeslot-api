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
Authorization: Token token=Ibq0LXVauK774KJUE_1Pt01vFqc
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/bca0019e-f36e-4f9e-81d6-6e62968c61e6</pre>

#### Body
```javascript
{
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/bca0019e-f36e-4f9e-81d6-6e62968c61e6&quot; -d &#39;{&quot;image&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Ibq0LXVauK774KJUE_1Pt01vFqc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;50e5a042b3e44609f6682b5b1d0f8e91&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ce6282bf-a455-470b-adbc-33da2ba4f5e3
X-Runtime: 0.036456
Vary: Origin
Content-Length: 418</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : "bca0019e-f36e-4f9e-81d6-6e62968c61e6",
  "name" : "foo",
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2016-01-29T19:38:55.036Z",
  "updatedAt" : "2016-01-29T19:38:55.076Z",
  "deletedAt" : null,
  "owner" : {
    "id" : 12,
    "username" : "User 90",
    "createdAt" : "2016-01-29T19:38:55.020Z",
    "updatedAt" : "2016-01-29T19:38:55.020Z",
    "deletedAt" : null,
    "image" : ""
  },
  "membershipState" : "active"
}
```
