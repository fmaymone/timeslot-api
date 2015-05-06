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
Authorization: Token token=u3wA5zRH-3S1_PrFTzp6HEP_e9E
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/19/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/19/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=u3wA5zRH-3S1_PrFTzp6HEP_e9E&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;7de9fa2d00de9f6cd86e544cf1fc4b27&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ae7875c5-111f-4550-9b43-0f1d44ec702f
X-Runtime: 0.011409
Content-Length: 503</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "groupId" : 19,
  "size" : 6,
  "members" : [
    {
      "userId" : 72,
      "username" : "User 72",
      "userUrl" : "http://example.org/v1/users/72"
    },
    {
      "userId" : 73,
      "username" : "User 73",
      "userUrl" : "http://example.org/v1/users/73"
    },
    {
      "userId" : 74,
      "username" : "User 74",
      "userUrl" : "http://example.org/v1/users/74"
    },
    {
      "userId" : 75,
      "username" : "User 75",
      "userUrl" : "http://example.org/v1/users/75"
    },
    {
      "userId" : 76,
      "username" : "User 76",
      "userUrl" : "http://example.org/v1/users/76"
    },
    {
      "userId" : 78,
      "username" : "User 78",
      "userUrl" : "http://example.org/v1/users/78"
    }
  ]
}</pre>
