# Groups API

## Invite multiple users to group

### POST /v1/groups/:group_uuid/members

Inviting user must be group owner or group must allow invites by group members.

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
Authorization: Token token=yqH-o0B8v2H6xfLYd4mLmgauZyE
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/6fb3211d-0a06-41bc-8038-75e844cb36e7/members</pre>

#### Body
```javascript
{
  "invitees" : [
    62,
    63,
    64
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/6fb3211d-0a06-41bc-8038-75e844cb36e7/members&quot; -d &#39;{&quot;invitees&quot;:[62,63,64]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=yqH-o0B8v2H6xfLYd4mLmgauZyE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;4bb2fd4a42ee3d47c401741840dfed8b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 53ae3276-f03a-47be-b782-0388e257988e
X-Runtime: 0.142211
Vary: Origin
Content-Length: 266</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "groupId" : "6fb3211d-0a06-41bc-8038-75e844cb36e7",
  "size" : 4,
  "related" : [
    {
      "userId" : 61,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 62,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 63,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 64,
      "state" : "invited",
      "deletedAt" : null
    }
  ]
}
```
