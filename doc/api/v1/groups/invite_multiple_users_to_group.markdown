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
Authorization: Token token=I2995sTpfdkepDcCF-UKvvJ20zE
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
	-H &quot;Authorization: Token token=I2995sTpfdkepDcCF-UKvvJ20zE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;c538c00a678539ad35a11b8fd44e86ec&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b05d46f7-91f1-4c51-a61c-f76df2b387c0
X-Runtime: 0.039613
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
