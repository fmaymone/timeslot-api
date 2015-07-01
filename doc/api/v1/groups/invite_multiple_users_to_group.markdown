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
Authorization: Token token=XAfJ_CQqKs7qEMGAL31qQpdArmU
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
	-H &quot;Authorization: Token token=XAfJ_CQqKs7qEMGAL31qQpdArmU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;42e3e3f66718d831a200651f98c28819&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: c7ce6653-917e-49db-8761-b29be2d30da7
X-Runtime: 0.046952
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
