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
Authorization: Token token=CEAEEK1lemyzFsoJdFjsJFvZL8k
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/19/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/19/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=CEAEEK1lemyzFsoJdFjsJFvZL8k&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a06e5cd98d5af22334ea4e7fbd56ff5a&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d6a0afcf-6628-42e1-a9bf-be0082c100a7
X-Runtime: 0.010868
Content-Length: 503</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 19,
  "size" : 6,
  "members" : [
    {
      "userId" : 82,
      "username" : "User 79",
      "userUrl" : "http://example.org/v1/users/82"
    },
    {
      "userId" : 83,
      "username" : "User 80",
      "userUrl" : "http://example.org/v1/users/83"
    },
    {
      "userId" : 84,
      "username" : "User 81",
      "userUrl" : "http://example.org/v1/users/84"
    },
    {
      "userId" : 85,
      "username" : "User 82",
      "userUrl" : "http://example.org/v1/users/85"
    },
    {
      "userId" : 86,
      "username" : "User 83",
      "userUrl" : "http://example.org/v1/users/86"
    },
    {
      "userId" : 88,
      "username" : "User 85",
      "userUrl" : "http://example.org/v1/users/88"
    }
  ]
}
```
