# Groups API

## Get list of all users related to a group

### GET /v1/groups/:group_uuid/related

Also includes user with pending or refused invitations and inactive or kicked members.

returns 200 &amp; list of all users related to this group

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
Description : ID of the group to get related users for


### Response Fields

Name : groupId
Description : ID of the group

Name : size
Description : Number of group members (excluding owner)

Name : related
Description : Array of related users

Name : userId
Description : ID of user

Name : state
Description : state of membership

Name : deletedAt
Description : Deletion date of membership

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=UaC0cYP3YQkEWAddqkwEf1ZH-Wo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/9d819e54-e925-44d5-a094-5a6521a0e7f1/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/9d819e54-e925-44d5-a094-5a6521a0e7f1/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=UaC0cYP3YQkEWAddqkwEf1ZH-Wo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;99f4be1eadd8ebb6d05be92d29a931d1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5ded63d8-4c10-444e-a922-3b76f7c7cf52
X-Runtime: 0.051124
Vary: Origin
Content-Length: 478</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : "9d819e54-e925-44d5-a094-5a6521a0e7f1",
  "size" : 7,
  "related" : [
    {
      "userId" : 36,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 37,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 38,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 39,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 40,
      "state" : "invited",
      "deletedAt" : "2016-01-29T19:38:51.093Z"
    },
    {
      "userId" : 41,
      "state" : "invited",
      "deletedAt" : "2016-01-29T19:38:51.093Z"
    },
    {
      "userId" : 42,
      "state" : "invited",
      "deletedAt" : "2016-01-29T19:38:51.093Z"
    }
  ]
}
```
