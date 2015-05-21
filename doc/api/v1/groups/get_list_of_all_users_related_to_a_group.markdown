# Groups API

## Get list of all users related to a group

### GET /v1/groups/:group_id/related

Also includes user with pending or refused invitations and inactive or kicked members.

returns 200 &amp; list of all users related to this group

returns 404 if ID is invalid

### Parameters

Name : group_id *- required -*
Description : ID of the group to get related users for


### Response Fields

Name : groupId
Description : ID of the group

Name : size
Description : Number of group members (excluding owner)

Name : related
Description : Array of related users

Name : userId
Description : ID of user

Name : state
Description : state of membership

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=07LZ1PZKBlhuEIbZX711lfbLT8g
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=07LZ1PZKBlhuEIbZX711lfbLT8g&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ca74c58c8409de9f7e15dc8d6bbb9dfc&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5e6a6e16-cfec-492b-9010-4c581cad449d
X-Runtime: 0.019313
Content-Length: 419</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 21,
  "size" : 7,
  "related" : [
    {
      "userId" : 96,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 97,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 98,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 99,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 100,
      "state" : "011",
      "deletedAt" : "2015-05-19T10:51:47.819Z"
    },
    {
      "userId" : 101,
      "state" : "011",
      "deletedAt" : "2015-05-19T10:51:47.819Z"
    },
    {
      "userId" : 102,
      "state" : "011",
      "deletedAt" : "2015-05-19T10:51:47.819Z"
    }
  ]
}
```
