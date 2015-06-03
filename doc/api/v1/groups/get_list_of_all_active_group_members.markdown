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
Authorization: Token token=RQ7dtoO_qHYK7B41cBg0H6DkVSE
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/19/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/19/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=RQ7dtoO_qHYK7B41cBg0H6DkVSE&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;18400060c5db8df78aa15474a63d332b&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e7f12577-29e8-48ed-8539-79bea89272e6
X-Runtime: 0.014607
Content-Length: 521</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 19,
  "size" : 6,
  "members" : [
    {
      "userId" : 107,
      "username" : "User 104",
      "userUrl" : "http://example.org/v1/users/107"
    },
    {
      "userId" : 108,
      "username" : "User 105",
      "userUrl" : "http://example.org/v1/users/108"
    },
    {
      "userId" : 109,
      "username" : "User 106",
      "userUrl" : "http://example.org/v1/users/109"
    },
    {
      "userId" : 110,
      "username" : "User 107",
      "userUrl" : "http://example.org/v1/users/110"
    },
    {
      "userId" : 111,
      "username" : "User 108",
      "userUrl" : "http://example.org/v1/users/111"
    },
    {
      "userId" : 113,
      "username" : "User 110",
      "userUrl" : "http://example.org/v1/users/113"
    }
  ]
}
```
