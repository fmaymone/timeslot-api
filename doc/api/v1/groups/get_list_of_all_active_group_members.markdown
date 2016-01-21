# Groups API

## Get list of all active group members

### GET /v1/groups/:group_id/members

returns 200 and a list of all active group members

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to get members for


### Response Fields

Name : groupId
Description : ID of the group

Name : size
Description : Number of active group members

Name : members
Description : Array of active members

Name : userId
Description : ID of member

Name : username
Description : name of member

Name : userUrl
Description : URL for member

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=AoBHpapkdIifjuCoFjbUAVXjq6I
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/13/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/13/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=AoBHpapkdIifjuCoFjbUAVXjq6I&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3ae52912a063cf414c3cae52a5683854&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 75c08466-3e0d-48aa-b35e-2ae9192e5a90
X-Runtime: 0.011485
Vary: Origin
Content-Length: 509</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 13,
  "size" : 6,
  "members" : [
    {
      "userId" : 24,
      "username" : "User 102",
      "userUrl" : "http://example.org/v1/users/24"
    },
    {
      "userId" : 25,
      "username" : "User 103",
      "userUrl" : "http://example.org/v1/users/25"
    },
    {
      "userId" : 26,
      "username" : "User 104",
      "userUrl" : "http://example.org/v1/users/26"
    },
    {
      "userId" : 27,
      "username" : "User 105",
      "userUrl" : "http://example.org/v1/users/27"
    },
    {
      "userId" : 28,
      "username" : "User 106",
      "userUrl" : "http://example.org/v1/users/28"
    },
    {
      "userId" : 30,
      "username" : "User 108",
      "userUrl" : "http://example.org/v1/users/30"
    }
  ]
}
```
