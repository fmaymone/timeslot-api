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
Authorization: Token token=tTEZ5iOJI71DJHUjI9nu4rW12Fg
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/78541fb6-b2d1-44f3-a9b8-8704267c93ee/members</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com/v1/groups/78541fb6-b2d1-44f3-a9b8-8704267c93ee/members&quot; -d &#39;{&quot;invitees&quot;:[392,393,394]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=tTEZ5iOJI71DJHUjI9nu4rW12Fg&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;3f979385f7a0bdf8bc4fc33d18e5603b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ca880e7e-606c-4582-a3f8-e3ffcd12e79b
X-Runtime: 0.416743
Content-Length: 246</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
