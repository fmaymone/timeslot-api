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
Authorization: Token token=s3R26z76be5Mq7fJTtxBTMVINKc
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/19/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/19/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=s3R26z76be5Mq7fJTtxBTMVINKc&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;74c3abf246dcf62d4a5b315e1319350c&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: d8af9d39-222d-47cb-8476-0feeae493dcd
X-Runtime: 0.015476
Vary: Origin
Content-Length: 515</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 19,
  "size" : 6,
  "members" : [
    {
      "userId" : 112,
      "username" : "User 88",
      "userUrl" : "http://example.org/v1/users/112"
    },
    {
      "userId" : 113,
      "username" : "User 89",
      "userUrl" : "http://example.org/v1/users/113"
    },
    {
      "userId" : 114,
      "username" : "User 90",
      "userUrl" : "http://example.org/v1/users/114"
    },
    {
      "userId" : 115,
      "username" : "User 91",
      "userUrl" : "http://example.org/v1/users/115"
    },
    {
      "userId" : 116,
      "username" : "User 92",
      "userUrl" : "http://example.org/v1/users/116"
    },
    {
      "userId" : 118,
      "username" : "User 94",
      "userUrl" : "http://example.org/v1/users/118"
    }
  ]
}
```
