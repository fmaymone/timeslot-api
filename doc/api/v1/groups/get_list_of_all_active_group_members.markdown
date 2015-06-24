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
Authorization: Token token=IqeGE4pqdoAky1sXTZP2GowbPjU
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/19/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/19/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=IqeGE4pqdoAky1sXTZP2GowbPjU&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a7783789575fe2ffc297437203dbfa20&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e0aadcc9-2ac1-46b1-95f4-7ecae49fc460
X-Runtime: 0.016746
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
      "userId" : 87,
      "username" : "User 84",
      "userUrl" : "http://example.org/v1/users/87"
    },
    {
      "userId" : 89,
      "username" : "User 86",
      "userUrl" : "http://example.org/v1/users/89"
    }
  ]
}
```
