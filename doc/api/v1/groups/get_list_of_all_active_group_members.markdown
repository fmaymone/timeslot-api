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
Authorization: Token token=OH7xaHT6x7QQzhAsWgBu2xYrBTw
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/14/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/14/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=OH7xaHT6x7QQzhAsWgBu2xYrBTw&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a4159990222864ac952f56492b66ef75&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a172bd5d-ae7a-466c-9295-205c383485cd
X-Runtime: 0.013146
Vary: Origin
Content-Length: 503</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 14,
  "size" : 6,
  "members" : [
    {
      "userId" : 40,
      "username" : "User 93",
      "userUrl" : "http://example.org/v1/users/40"
    },
    {
      "userId" : 41,
      "username" : "User 94",
      "userUrl" : "http://example.org/v1/users/41"
    },
    {
      "userId" : 42,
      "username" : "User 95",
      "userUrl" : "http://example.org/v1/users/42"
    },
    {
      "userId" : 43,
      "username" : "User 96",
      "userUrl" : "http://example.org/v1/users/43"
    },
    {
      "userId" : 44,
      "username" : "User 97",
      "userUrl" : "http://example.org/v1/users/44"
    },
    {
      "userId" : 46,
      "username" : "User 99",
      "userUrl" : "http://example.org/v1/users/46"
    }
  ]
}
```
