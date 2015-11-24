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
Authorization: Token token=jOBFpJl_vTRQzzB9shp63sYYHdY
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /v1/groups/16/related</pre>

#### cURL

<pre class="request">curl &quot;http://localhost:5000/v1/groups/16/related&quot; -X GET \
	-H &quot;Accept: application/json&quot; \
	-H &quot;Authorization: Token token=jOBFpJl_vTRQzzB9shp63sYYHdY&quot; \
	-H &quot;Host: example.org&quot;</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
Content-Type: application/json; charset=utf-8
ETag: W/&quot;a5b734c9dd700a692e6668de855a8507&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: eaee75c8-5e0b-48d7-8274-83b67732d45a
X-Runtime: 0.021778
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
      "deletedAt" : "2015-11-24T23:47:26.716Z"
    },
    {
      "userId" : 59,
      "state" : "invited",
      "deletedAt" : "2015-11-24T23:47:26.716Z"
    },
    {
      "userId" : 60,
      "state" : "invited",
      "deletedAt" : "2015-11-24T23:47:26.716Z"
    }
  ]
}
```
