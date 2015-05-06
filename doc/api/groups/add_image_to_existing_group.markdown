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
Authorization: Token token=rcknBd9HrwW9UYm5xknv1KUQRig
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /v1/groups/15</pre>

#### Body

<pre>{
  "image" : {
    "publicId" : "v1234567/dfhjghjkdisudgfds7iyf.jpg"
  }
}</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/15&quot; -d &#39;{&quot;image&quot;:{&quot;publicId&quot;:&quot;v1234567/dfhjghjkdisudgfds7iyf.jpg&quot;}}&#39; -X PATCH \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=rcknBd9HrwW9UYm5xknv1KUQRig&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;c862c94a36aa4bcd88961b03b7893179&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1558f464-d09a-496a-bdb5-0f4bb817170c
X-Runtime: 0.013127
Content-Length: 250</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id" : 15,
  "name" : "foo",
  "ownerId" : 54,
  "membersCanPost" : false,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-06T14:45:15.005Z",
  "updatedAt" : "2015-05-06T14:45:15.005Z",
  "deletedAt" : null,
  "image" : "v1234567/dfhjghjkdisudgfds7iyf.jpg",
  "membershipState" : "active"
}</pre>
