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

Name : deletedAt
Description : Deletion date of membership

### Request

#### Headers

<pre>Accept: application/json
Authorization: Token token=pORo7JjtgF5DinEX3XuKCnpyHIo
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=pORo7JjtgF5DinEX3XuKCnpyHIo&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;55d0310efb0d5dc06d9f36855bb7773d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 7b80d883-9034-4883-b17d-428e625043c0
X-Runtime: 0.022304
Vary: Origin
Content-Length: 449</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 21,
  "size" : 7,
  "related" : [
    {
      "userId" : 126,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 127,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 128,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 129,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 130,
      "state" : "invited",
      "deletedAt" : "2015-10-03T22:30:37.599Z"
    },
    {
      "userId" : 131,
      "state" : "invited",
      "deletedAt" : "2015-10-03T22:30:37.599Z"
    },
    {
      "userId" : 132,
      "state" : "invited",
      "deletedAt" : "2015-10-03T22:30:37.599Z"
    }
  ]
}
```
