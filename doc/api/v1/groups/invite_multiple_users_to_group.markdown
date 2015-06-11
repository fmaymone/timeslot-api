# Groups API

## Invite multiple users to group

### POST /v1/groups/:group_id/members

Inviting user must be group owner or group must allow invites by group members.

returns 201 if invite successfully created

returns 403 if user is not allowed to invite

returns 404 if group ID is invalid

returns 422 if parameters are missing

### Parameters

Name : group_id *- required -*
Description : ID of the group

Name : invitees *- required -*
Description : User IDs to be invited to group

### Request

#### Headers

<pre>Content-Type: application/json
Authorization: Token token=0O0v325V2BZ3V12Zo6czvz3ueGk
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/25/members</pre>

#### Body
```javascript
{
  "invitees" : [
    116,
    117,
    118
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/25/members&quot; -d &#39;{&quot;invitees&quot;:[116,117,118]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=0O0v325V2BZ3V12Zo6czvz3ueGk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;42e3e3f66718d831a200651f98c28819&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e0347a46-3504-4543-b411-3d11992d0217
X-Runtime: 0.039881
Content-Length: 234</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "groupId" : 25,
  "size" : 4,
  "related" : [
    {
      "userId" : 115,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 116,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 117,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 118,
      "state" : "invited",
      "deletedAt" : null
    }
  ]
}
```
