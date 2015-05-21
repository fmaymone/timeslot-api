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
Authorization: Token token=fqlCO57-oZFER0tmKTm6c_Qykok
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/25/members</pre>

#### Body
```javascript
{
  "invitees" : [
    115,
    116,
    117
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/25/members&quot; -d &#39;{&quot;invitees&quot;:[115,116,117]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=fqlCO57-oZFER0tmKTm6c_Qykok&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;690a4e6f4aa689b5968d09c5c35d3e3d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a310a9be-1a07-4427-9791-2957bd7c800d
X-Runtime: 0.034474
Content-Length: 219</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "groupId" : 25,
  "size" : 4,
  "related" : [
    {
      "userId" : 114,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 115,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 116,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 117,
      "state" : "011",
      "deletedAt" : null
    }
  ]
}
```
