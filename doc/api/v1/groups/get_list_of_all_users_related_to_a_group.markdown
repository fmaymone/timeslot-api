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
Authorization: Token token=mvLsbd6sFbYaGLaHjzF07zFPvYk
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/15/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/15/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=mvLsbd6sFbYaGLaHjzF07zFPvYk&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;fb0a18ab947b1fcdf1e433deeb8dd702&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: b789bc83-ae78-4edc-ba08-888fc6ae16bf
X-Runtime: 0.012530
Vary: Origin
Content-Length: 442</pre>

#### Status

<pre>200 OK</pre>

#### Body

```javascript
{
  "groupId" : 15,
  "size" : 7,
  "related" : [
    {
      "userId" : 38,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 39,
      "state" : "active",
      "deletedAt" : null
    },
    {
      "userId" : 40,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 41,
      "state" : "invited",
      "deletedAt" : null
    },
    {
      "userId" : 42,
      "state" : "invited",
      "deletedAt" : "2016-01-21T23:11:32.964Z"
    },
    {
      "userId" : 43,
      "state" : "invited",
      "deletedAt" : "2016-01-21T23:11:32.964Z"
    },
    {
      "userId" : 44,
      "state" : "invited",
      "deletedAt" : "2016-01-21T23:11:32.964Z"
    }
  ]
}
```
