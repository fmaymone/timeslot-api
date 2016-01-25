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
Authorization: Token token=XbK-pWXKpNlH72XK12E7t56BnXg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/14/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/14/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=XbK-pWXKpNlH72XK12E7t56BnXg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;8ce2d465dfad94772450e34fb892f4c0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 1a7b76bb-1779-4ad2-8c4b-4222c8837165
X-Runtime: 0.015935
Vary: Origin
Content-Length: 505</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 14,
  "size" : 6,
  "members" : [
    {
      "userId" : 30,
      "username" : "User 96",
      "userUrl" : "http://example.org/v1/users/30"
    },
    {
      "userId" : 31,
      "username" : "User 97",
      "userUrl" : "http://example.org/v1/users/31"
    },
    {
      "userId" : 32,
      "username" : "User 98",
      "userUrl" : "http://example.org/v1/users/32"
    },
    {
      "userId" : 33,
      "username" : "User 99",
      "userUrl" : "http://example.org/v1/users/33"
    },
    {
      "userId" : 34,
      "username" : "User 100",
      "userUrl" : "http://example.org/v1/users/34"
    },
    {
      "userId" : 36,
      "username" : "User 102",
      "userUrl" : "http://example.org/v1/users/36"
    }
  ]
}
```
