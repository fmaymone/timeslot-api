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
Authorization: Token token=VnLfCoAJe_0cORxjCbfY3xvRehg
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/16/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/16/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=VnLfCoAJe_0cORxjCbfY3xvRehg&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;ff242ea62ecac1884808f432d83fedd8&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 4c367968-2434-4b63-a919-139c7fb68aa4
X-Runtime: 0.022827
Vary: Origin
Content-Length: 442</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 16,
  "size" : 7,
  "related" : [
    {
      "userId" : 54,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 55,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 56,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 57,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 58,
      "state" : "invited",
      "deletedAt" : "2015-12-04T16:56:44.516Z"
    },
    {
      "userId" : 59,
      "state" : "invited",
      "deletedAt" : "2015-12-04T16:56:44.516Z"
    },
    {
      "userId" : 60,
      "state" : "invited",
      "deletedAt" : "2015-12-04T16:56:44.516Z"
    }
  ]
}
```
