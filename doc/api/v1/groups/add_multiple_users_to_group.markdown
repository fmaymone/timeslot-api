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
Authorization: Token token=1t9-Tiqzzt_PQ-5DD91rfH41wOU
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/331787e2-9a92-4cc3-959e-0fc01b5a5dc3/members</pre>

#### Body
```javascript

```


#### cURL

<pre class="request">curl &quot;https://tsinc-alpha.herokuapp.com//v1/groups/331787e2-9a92-4cc3-959e-0fc01b5a5dc3/members&quot; -d &#39;{&quot;invitees&quot;:[392,393,394]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=1t9-Tiqzzt_PQ-5DD91rfH41wOU&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;89afdd495648942ac8ea2fc7112ddb6b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2bdf49f5-174f-40b2-8ef5-f073a9100b4b
X-Runtime: 0.245499
Content-Length: 246</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript

```
