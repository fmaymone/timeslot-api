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
Authorization: Token token=K1znSYiCMiHE9WcBhUKf2L3pdwY
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/ab824ea4-4300-446f-88af-a58fc7358cca/members</pre>

#### Body
```javascript
{
  "invitees" : [
    71,
    72,
    73
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/ab824ea4-4300-446f-88af-a58fc7358cca/members&quot; -d &#39;{&quot;invitees&quot;:[71,72,73]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=K1znSYiCMiHE9WcBhUKf2L3pdwY&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;47928c4984944172f4d8b82af29bf484&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 588a5665-552b-475b-b370-44b2b7b1e9f8
X-Runtime: 0.065108
Vary: Origin
Content-Length: 242</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "ab824ea4-4300-446f-88af-a58fc7358cca",
  "size" : 4,
  "related" : [
    {
      "id" : 73,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 72,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 71,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 70,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
