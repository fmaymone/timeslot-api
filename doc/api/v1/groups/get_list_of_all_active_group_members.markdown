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
Authorization: Token token=8qXy0oaqda45GVhTQ4ZJcU8RQaI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/14/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/14/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=8qXy0oaqda45GVhTQ4ZJcU8RQaI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;6284ad2ae6ee582a4918da753abb5031&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a51c95eb-db6d-457b-9801-11983fa93ae6
X-Runtime: 0.012576
Vary: Origin
Content-Length: 504</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 14,
  "size" : 6,
  "members" : [
    {
      "userId" : 46,
      "username" : "User 101",
      "userUrl" : "http://example.org/v1/users/46"
    },
    {
      "userId" : 44,
      "username" : "User 99",
      "userUrl" : "http://example.org/v1/users/44"
    },
    {
      "userId" : 43,
      "username" : "User 98",
      "userUrl" : "http://example.org/v1/users/43"
    },
    {
      "userId" : 42,
      "username" : "User 97",
      "userUrl" : "http://example.org/v1/users/42"
    },
    {
      "userId" : 41,
      "username" : "User 96",
      "userUrl" : "http://example.org/v1/users/41"
    },
    {
      "userId" : 40,
      "username" : "User 95",
      "userUrl" : "http://example.org/v1/users/40"
    }
  ]
}
```
