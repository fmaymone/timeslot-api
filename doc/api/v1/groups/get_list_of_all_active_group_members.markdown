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
Authorization: Token token=Thcc5ZiexXu1ZnD6_KfsutN81W8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/19/members</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/19/members&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=Thcc5ZiexXu1ZnD6_KfsutN81W8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;1cccaf2bfbba6548999d5fed3fa46d76&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 623aa11d-7f2c-4b90-a159-ae579df1db4e
X-Runtime: 0.014290
Content-Length: 505</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 19,
  "size" : 6,
  "members" : [
    {
      "userId" : 95,
      "username" : "User 80",
      "userUrl" : "http://example.org/v1/users/95"
    },
    {
      "userId" : 96,
      "username" : "User 81",
      "userUrl" : "http://example.org/v1/users/96"
    },
    {
      "userId" : 97,
      "username" : "User 82",
      "userUrl" : "http://example.org/v1/users/97"
    },
    {
      "userId" : 98,
      "username" : "User 83",
      "userUrl" : "http://example.org/v1/users/98"
    },
    {
      "userId" : 99,
      "username" : "User 84",
      "userUrl" : "http://example.org/v1/users/99"
    },
    {
      "userId" : 101,
      "username" : "User 86",
      "userUrl" : "http://example.org/v1/users/101"
    }
  ]
}
```
