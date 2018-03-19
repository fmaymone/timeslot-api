# Groups API

## Add multiple users to group

### POST /v1/groups/:group_uuid/members

Adds the given Users to the group. Inviting user must be group member.

returns 201 if invite successfully created

returns 403 if user is not allowed to invite

returns 404 if group UUID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_uuid *- required -*
Description : ID of the group

Name : invitees *- required -*
Description : User IDs to be invited to group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=eDAQWcytt-GivZpxjD8c8LaaAl0
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/3a604cb0-71d6-451c-b3b4-1ba60a21be84/members</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/3a604cb0-71d6-451c-b3b4-1ba60a21be84/members&quot; -d &#39;{&quot;invitees&quot;:[392,393,394]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=eDAQWcytt-GivZpxjD8c8LaaAl0&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;c37caa2f55f572a5ced769eeb081a83a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a106a983-ec5b-4d8f-a534-43ad7fa7aff8
X-Runtime: 0.350773
Content-Length: 246</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
