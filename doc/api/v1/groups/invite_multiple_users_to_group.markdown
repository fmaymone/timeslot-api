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
Authorization: Token token=sdel7axi6ReuIrDwfAVX5BaLVso
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/25/members</pre>

#### Body
```javascript
{
  "invitees" : [
    145,
    146,
    147
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/25/members&quot; -d &#39;{&quot;invitees&quot;:[145,146,147]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=sdel7axi6ReuIrDwfAVX5BaLVso&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c538c00a678539ad35a11b8fd44e86ec&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2d0302a8-1a17-4c1f-acfc-85241b75ae27
X-Runtime: 0.051461
Vary: Origin
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
      "userId" : 144,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 145,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 146,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 147,
      "state" : "invited",
      "deletedAt" : null
    }
  ]
}
```
