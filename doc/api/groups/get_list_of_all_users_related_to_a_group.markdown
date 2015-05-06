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
Authorization: Token token=V-rBoxww5LckqBXhKhKPzTcLZhI
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=V-rBoxww5LckqBXhKhKPzTcLZhI&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;e20f7561d20d4eb567309f63dfe1a26f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a90b0546-8a4a-4b7d-8f8f-41d54489eaf3
X-Runtime: 0.018595
Content-Length: 416</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 21,
  "size" : 7,
  "related" : [
    {
      "userId" : 86,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 87,
      "state" : "111",
      "deletedAt" : null
    },
    {
      "userId" : 88,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 89,
      "state" : "011",
      "deletedAt" : null
    },
    {
      "userId" : 90,
      "state" : "011",
      "deletedAt" : "2015-05-06T21:29:28.044Z"
    },
    {
      "userId" : 91,
      "state" : "011",
      "deletedAt" : "2015-05-06T21:29:28.044Z"
    },
    {
      "userId" : 92,
      "state" : "011",
      "deletedAt" : "2015-05-06T21:29:28.044Z"
    }
  ]
}
```
