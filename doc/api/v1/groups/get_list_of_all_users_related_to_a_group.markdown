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
Authorization: Token token=nEaiX-hz07mtK709DyqvC3KL4t8
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/21/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/21/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=nEaiX-hz07mtK709DyqvC3KL4t8&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;f0b472d4b3d9ccf2caad5e4894cef97d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: ebab3e03-a013-461b-a4ce-79651e3dc803
X-Runtime: 0.033022
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
      "userId" : 109,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 110,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 111,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 112,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 113,
      "state" : "invited",
      "deletedAt" : "2015-07-02T12:34:12.954Z"
    },
    {
      "userId" : 114,
      "state" : "invited",
      "deletedAt" : "2015-07-02T12:34:12.954Z"
    },
    {
      "userId" : 115,
      "state" : "invited",
      "deletedAt" : "2015-07-02T12:34:12.954Z"
    }
  ]
}
```
