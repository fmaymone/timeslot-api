# Groups API

## Add image to existing group

### PATCH /v1/groups/:group_id

First a cloudinary signature needs to be fetched by the client from the API. After uploading the image to cloudinary the client updates the group with the image information.

returns 200 and the group data if the image was successfully added or updated

### Parameters

Name : group_id *- required -*
Description : ID of the group to update

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
Authorization: Token token=rZ42Js-8ta4Nrm8WT234R2jYQWM
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/15</pre>

#### Body
```javascript
{
  "image" : {
    "publicId" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
  }
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/15&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=rZ42Js-8ta4Nrm8WT234R2jYQWM&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;0d010deee43032c132bca415f211061b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a7f73e70-aa24-451c-8e7e-c624e159089d
X-Runtime: 0.016538
Content-Length: 250</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "id" : 15,
  "name" : "foo",
  "ownerId" : 54,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-06T21:29:29.529Z",
  "updatedAt" : "2015-05-06T21:29:29.529Z",
  "deletedAt" : null,
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "membershipState" : "active"
}
```
