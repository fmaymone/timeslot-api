# Groups API

## Get list of all active group members

### GET /v1/groups/:group_uuid/members

returns 200 and a list of all active group members

returns 404 if UUID is invalid

### Parameters

Name : group_uuid *- required -*
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
Authorization: Token token=l3NozhaFN0gumtQ3tFikzAz6Zp0
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/0f889799-3068-4646-a634-39079f647836/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/0f889799-3068-4646-a634-39079f647836/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=l3NozhaFN0gumtQ3tFikzAz6Zp0&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7c9c12f834ee2f9f66e4b1d47ab774b6&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 478977b3-fa99-4878-8b43-e3976ccb9490
X-Runtime: 0.078154
Vary: Origin
Content-Length: 545</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : "0f889799-3068-4646-a634-39079f647836",
  "size" : 6,
  "members" : [
    {
      "userId" : 29,
      "username" : "User 107",
      "userUrl" : "http://example.org/v1/users/29"
    },
    {
      "userId" : 30,
      "username" : "User 108",
      "userUrl" : "http://example.org/v1/users/30"
    },
    {
      "userId" : 31,
      "username" : "User 109",
      "userUrl" : "http://example.org/v1/users/31"
    },
    {
      "userId" : 32,
      "username" : "User 110",
      "userUrl" : "http://example.org/v1/users/32"
    },
    {
      "userId" : 33,
      "username" : "User 111",
      "userUrl" : "http://example.org/v1/users/33"
    },
    {
      "userId" : 35,
      "username" : "User 113",
      "userUrl" : "http://example.org/v1/users/35"
    }
  ]
}
```
