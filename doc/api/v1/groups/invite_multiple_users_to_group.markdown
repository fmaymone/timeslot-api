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
Authorization: Token token=Dv_6LjxgsQihy-X22CH44nXOLwo
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/20/members</pre>

#### Body
```javascript
{
  "invitees" : [
    63,
    64,
    65
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/20/members&quot; -d &#39;{&quot;invitees&quot;:[63,64,65]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=Dv_6LjxgsQihy-X22CH44nXOLwo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;46d1087c78704c8982608b237f5246e4&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 22e35ace-a729-4d87-82d5-68ef3365bfb1
X-Runtime: 0.029435
Vary: Origin
Content-Length: 230</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "groupId" : 20,
  "size" : 4,
  "related" : [
    {
      "userId" : 62,
      "state" : "active",
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
    },
    {
      "userId" : 65,
      "state" : "invited",
      "deletedAt" : null
    }
  ]
}
```
