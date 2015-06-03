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
Authorization: Token token=LFozNHTMY47LdyMOm9DNZEnYmbI
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/25/members</pre>

#### Body
```javascript
{
  "invitees" : [
    140,
    141,
    142
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/25/members&quot; -d &#39;{&quot;invitees&quot;:[140,141,142]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=LFozNHTMY47LdyMOm9DNZEnYmbI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a7e5c2c1716ec40c0dfa0e893abfca86&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5af5675-144a-4a51-a3e5-1e7f8a79e7f5
X-Runtime: 0.032577
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
      "userId" : 139,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 140,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 141,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 142,
      "state" : "011",
      "deletedAt" : null
    }
  ]
}
```
