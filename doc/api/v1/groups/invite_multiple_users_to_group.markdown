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
Authorization: Token token=j7ghi37OQWxTWQc5WkiJItf3qB0
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/19/members</pre>

#### Body
```javascript
{
  "invitees" : [
    57,
    58,
    59
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/19/members&quot; -d &#39;{&quot;invitees&quot;:[57,58,59]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=j7ghi37OQWxTWQc5WkiJItf3qB0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3d835e7a29196dbe44e74d587b8ff792&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: aa8d224d-b91c-4931-a006-40dfcef170f0
X-Runtime: 0.032255
Vary: Origin
Content-Length: 230</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "groupId" : 19,
  "size" : 4,
  "related" : [
    {
      "userId" : 56,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 57,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 58,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 59,
      "state" : "invited",
      "deletedAt" : null
    }
  ]
}
```
