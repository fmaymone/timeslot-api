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
Authorization: Token token=kc-92mQHPgiu8X_GU6e2r-BIqow
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /v1/groups/99c457a7-9b7d-4641-a55c-a52fd9de87cf/members</pre>

#### Body
```javascript
{
  "invitees" : [
    393,
    394,
    395
  ]
}
```


#### cURL

<pre class="request">curl &quot;http://tsinc-stage.timeslot.rocks/v1/groups/99c457a7-9b7d-4641-a55c-a52fd9de87cf/members&quot; -d &#39;{&quot;invitees&quot;:[393,394,395]}&#39; -X POST \
	-H &quot;Content-Type: application/json&quot; \
	-H &quot;Authorization: Token token=kc-92mQHPgiu8X_GU6e2r-BIqow&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
Vary: Accept-Encoding, Origin
ETag: W/&quot;9822dd5988ea31e8be1794a93f5068a6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 872d2346-9d8c-4c45-95c3-cd4de85a05c2
X-Runtime: 0.172461
Content-Length: 246</pre>

#### Status

<pre>201 Created</pre>

#### Body

```javascript
{
  "id" : "99c457a7-9b7d-4641-a55c-a52fd9de87cf",
  "size" : 4,
  "related" : [
    {
      "id" : 392,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 393,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 394,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "id" : 395,
      "state" : "active",
      "deletedAt" : null
    }
  ]
}
```
