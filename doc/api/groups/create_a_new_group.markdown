# Groups API

## Create a new group

### POST /v1/groups

Current User is the group owner andalso initially an active group member.

returns 201 and data of new group

returns 422 if parameters are missing

returns 422 if parameters are invalid

### Parameters

Name : name *- required -*
Description : Name of group (max. 255 characters)

Name : membersCanPost
Description : Can subscribers post?

Name : membersCanInvite
Description : Can subscribers invite friends?

Name : invitees
Description : Array of User IDs to be invited


### Response Fields

Name : id
Description : ID of the new group

### Request

#### Headers

<pre>Content-Type: application/json
Accept: application/json
Authorization: Token token=TEu0ISBQad6-JY193r-NrgdMLpo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups</pre>

#### Body
```javascript
{
  "name" : "foo",
  "invitees" : [
    59,
    60,
    61
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups&quot; -d &#39;{&quot;name&quot;:&quot;foo&quot;,&quot;invitees&quot;:[59,60,61]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=TEu0ISBQad6-JY193r-NrgdMLpo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8893dbdd4c0965fc8d84f1523696b70e&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4cdfd7ea-b3f2-4947-999b-40323449ae5a
X-Runtime: 0.043530
Content-Length: 217</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : 13,
  "name" : "foo",
  "ownerId" : 62,
  "membersCanPost" : true,
  "membersCanInvite" : false,
  "createdAt" : "2015-05-19T10:51:49.160Z",
  "updatedAt" : "2015-05-19T10:51:49.160Z",
  "deletedAt" : null,
  "image" : null,
  "membershipState" : "active"
}
```
