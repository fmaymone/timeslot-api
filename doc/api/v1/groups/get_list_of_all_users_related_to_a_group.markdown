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
Authorization: Token token=G2pDW3exLPig-MolOoaRkDxRnAg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=G2pDW3exLPig-MolOoaRkDxRnAg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;37a89328d7cf6849650276e23d99cb1f&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: fed59149-5908-4c6a-bcdc-7c438a309b3c
X-Runtime: 0.023921
Content-Length: 446</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 21,
  "size" : 7,
  "related" : [
    {
      "userId" : 97,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 98,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 99,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 100,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 101,
      "state" : "invited",
      "deletedAt" : "2015-06-11T16:20:47.232Z"
    },
    {
      "userId" : 102,
      "state" : "invited",
      "deletedAt" : "2015-06-11T16:20:47.232Z"
    },
    {
      "userId" : 103,
      "state" : "invited",
      "deletedAt" : "2015-06-11T16:20:47.232Z"
    }
  ]
}
```
