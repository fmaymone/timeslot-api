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
Authorization: Token token=P9XbilmAhCuzGJga65rUZ9zS0To
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:3000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=P9XbilmAhCuzGJga65rUZ9zS0To&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: &quot;4c257f9fb4a148979bb3cba53017b16d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: bb2f3d3f-0c9f-42b9-b8ee-d063aa290cdc
X-Runtime: 0.016798
Content-Length: 416</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
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
      "deletedAt" : "2015-05-06T14:45:14.087Z"
    },
    {
      "userId" : 91,
      "state" : "011",
      "deletedAt" : "2015-05-06T14:45:14.087Z"
    },
    {
      "userId" : 92,
      "state" : "011",
      "deletedAt" : "2015-05-06T14:45:14.087Z"
    }
  ]
}</pre>
